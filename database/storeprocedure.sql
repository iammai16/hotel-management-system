use  hoteldb;
DELIMITER $$

CREATE PROCEDURE check_login(IN p_username VARCHAR(50), IN p_password_md5 VARCHAR(32))
BEGIN
    SELECT * FROM hoteldb.user
    WHERE username = p_username AND password = p_password_md5;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN p_user_id INT)
BEGIN
    SELECT * FROM hoteldb.user WHERE id = p_user_id;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE get_customers_by_name(IN p_name VARCHAR(50))
BEGIN
    SELECT c.name, c.identification, u.avatar, ct.type
    FROM hoteldb.customer c
    JOIN hoteldb.customer_type ct ON c.customer_type_id = ct.id
    LEFT JOIN hoteldb.user u ON c.id = u.id
    WHERE p_name IS NULL OR c.name LIKE CONCAT('%', p_name, '%');
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE get_customer_by_user(IN p_user_id INT)
BEGIN
    SELECT c.*, ct.type
    FROM hoteldb.customer c
    JOIN hoteldb.customer_type ct ON c.customer_type_id = ct.id
    WHERE c.id = p_user_id;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE add_user(
    IN p_customer_type_id INT,
    IN p_name VARCHAR(50),
    IN p_username VARCHAR(50),
    IN p_password_md5 VARCHAR(32),
    IN p_phone VARCHAR(50),
    IN p_id_num VARCHAR(15),
    IN p_email VARCHAR(50),
    IN p_avatar VARCHAR(100),
    IN p_gender TINYINT(1)
)
BEGIN
    DECLARE user_id INT;

    INSERT INTO hoteldb.user(username, password, role, email, phone, avatar, gender)
    VALUES (p_username, p_password_md5, 'CUSTOMER', p_email, p_phone, p_avatar, p_gender);

    SET user_id = LAST_INSERT_ID();

    INSERT INTO hoteldb.customer(id, name, identification, customer_type_id)
    VALUES (user_id, p_name, p_id_num, p_customer_type_id);
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_user_by_username(IN p_username VARCHAR(50))
BEGIN
    SELECT * FROM hoteldb.user WHERE username = p_username;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_user_by_email(IN p_email VARCHAR(50))
BEGIN
    SELECT * FROM hoteldb.user WHERE email = p_email;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_user_by_phone(IN p_phone VARCHAR(50))
BEGIN
    SELECT * FROM hoteldb.user WHERE phone = p_phone;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_cus_type_by_identification(IN p_identification VARCHAR(15))
BEGIN
    SELECT ct.type
    FROM hoteldb.customer c
    JOIN hoteldb.customer_type ct ON c.customer_type_id = ct.id
    WHERE c.identification = p_identification;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_booked_rooms_by_identification(IN p_identification VARCHAR(15))
BEGIN
    SELECT r.name AS room_name, res.checkin_date, res.checkout_date, res.deposit
    FROM hoteldb.customer c
    JOIN hoteldb.reservation_detail rd ON c.customer_id = rd.customer_id
    JOIN hoteldb.reservation res ON res.id = rd.reservation_id
    JOIN hoteldb.room r ON res.room_id = r.id
    WHERE c.identification = p_identification AND res.is_checkin = 0;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_rented_rooms_by_identification(IN p_identification VARCHAR(15))
BEGIN
    SELECT r.name AS room_name, rr.checkin_date, rr.checkout_date, rr.deposit
    FROM hoteldb.customer c
    JOIN hoteldb.room_rental_detail rrd ON c.customer_id = rrd.customer_id
    JOIN hoteldb.room_rental rr ON rr.id = rrd.room_rental_id
    JOIN hoteldb.room r ON rr.room_id = r.id
    WHERE c.identification = p_identification AND rr.is_paid = 0;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE calculate_total_reservation_price(
    IN p_reservation_id INT,
    OUT p_total_price FLOAT
)
BEGIN
    DECLARE v_room_id INT;
    DECLARE v_deposit_rate FLOAT DEFAULT 0;
    DECLARE v_surcharge FLOAT DEFAULT 0;
    DECLARE v_customer_rate FLOAT DEFAULT 0;
    DECLARE v_base_price FLOAT DEFAULT 0;
    DECLARE v_total_services FLOAT DEFAULT 0;
    DECLARE v_total_room FLOAT DEFAULT 0;
    DECLARE v_room_rental_id INT;
    
    SELECT room_id INTO v_room_id
    FROM hoteldb.reservation
    WHERE id = p_reservation_id;

    SELECT id INTO v_room_rental_id
    FROM hoteldb.room_rental
    WHERE room_id = v_room_id AND reservation_id = p_reservation_id
    LIMIT 1;

    SELECT deposit_rate, surcharge, price
    INTO v_deposit_rate, v_surcharge, v_base_price
    FROM hoteldb.room_regulation
    WHERE room_type_id = (SELECT room_type_id FROM hoteldb.room WHERE id = v_room_id)
    ORDER BY id DESC
    LIMIT 1;

    SELECT AVG(ctr.rate)
    INTO v_customer_rate
    FROM hoteldb.customer_type_regulation ctr
    JOIN hoteldb.reservation_detail rd ON ctr.customer_type_id = (
        SELECT customer_type_id FROM hoteldb.customer WHERE customer_id = rd.customer_id LIMIT 1
    )
    WHERE rd.reservation_id = p_reservation_id;

    SET v_total_room = (v_base_price * v_customer_rate) + v_surcharge;

    IF v_room_rental_id IS NOT NULL THEN
        SELECT IFNULL(SUM(total_price), 0)
        INTO v_total_services
        FROM hoteldb.room_service
        WHERE room_rental_id = v_room_rental_id;
    ELSE
        SET v_total_services = 0;
    END IF;

    SET p_total_price = v_total_room + v_total_services;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE check_reservation(
    IN p_checkin DATETIME,
    IN p_checkout DATETIME,
    IN p_room_id INT,
    OUT is_available BOOLEAN
)
BEGIN
    DECLARE conflict_count INT;

    SELECT COUNT(*) INTO conflict_count
    FROM (
        SELECT checkin_date, checkout_date FROM hoteldb.reservation
        WHERE room_id = p_room_id AND (
            (checkin_date < p_checkout AND checkout_date > p_checkin)
        )
        UNION ALL
        SELECT checkin_date, checkout_date FROM hoteldb.room_rental
        WHERE room_id = p_room_id AND (
            (checkin_date < p_checkout AND checkout_date > p_checkin)
        )
    ) AS conflicts;

    IF conflict_count = 0 THEN
        SET is_available = TRUE;
    ELSE
        SET is_available = FALSE;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE check_customer_existence(
    IN p_identifications TEXT,
    OUT exists_flag BOOLEAN
)
BEGIN
    DECLARE found_count INT;

    SET @query = CONCAT('SELECT COUNT(*) INTO @found_count FROM hoteldb.customer WHERE identification IN (', p_identifications, ')');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    IF @found_count > 0 THEN
        SET exists_flag = TRUE;
    ELSE
        SET exists_flag = FALSE;
    END IF;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE hoteldb.mark_rental_as_paid (
    IN p_rental_id INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;
    DECLARE v_already_paid INT DEFAULT 0;

    SELECT COUNT(*) INTO v_exists
    FROM hoteldb.room_rental
    WHERE id = p_rental_id;

    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Room rental ID does not exist.';
    END IF;

    SELECT is_paid INTO v_already_paid
    FROM hoteldb.room_rental
    WHERE id = p_rental_id;

    IF v_already_paid = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Room rental has already been marked as paid.';
    END IF;

    -- Cập nhật trạng thái thanh toán
    UPDATE hoteldb.room_rental
    SET is_paid = 1
    WHERE id = p_rental_id;

END $$

DELIMITER ;





