USE hoteldb;

-- 1. Trigger kiểm tra trùng lịch đặt phòng (Reservation)
DELIMITER $$
CREATE TRIGGER trg_check_reservation_overlap
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM reservation
        WHERE room_id = NEW.room_id AND (
            (NEW.checkin_date BETWEEN checkin_date AND checkout_date) OR
            (NEW.checkout_date BETWEEN checkin_date AND checkout_date) OR
            (checkin_date BETWEEN NEW.checkin_date AND NEW.checkout_date)
        )
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This room is already booked during the selected time range.';
    END IF;
END$$
DELIMITER ;

-- 2. Trigger tính tiền đặt cọc khi tạo đơn đặt phòng
DELIMITER $$
CREATE TRIGGER trg_calc_deposit
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE v_price FLOAT DEFAULT 0;
    DECLARE v_deposit_rate FLOAT DEFAULT 0;

    SELECT rr.price, rr.deposit_rate
    INTO v_price, v_deposit_rate
    FROM room r
    JOIN room_regulation rr ON r.room_type_id = rr.room_type_id
    WHERE r.id = NEW.room_id
    LIMIT 1;

    SET NEW.deposit = v_price * v_deposit_rate;
END$$
DELIMITER ;

-- 3. Trigger tự động cập nhật trạng thái check-in sau khi thuê phòng
DELIMITER $$
CREATE TRIGGER trg_auto_checkin
AFTER INSERT ON room_rental
FOR EACH ROW
BEGIN
    UPDATE reservation
    SET is_checkin = 1
    WHERE id = NEW.reservation_id;
END$$
DELIMITER ;

-- 4. Trigger kiểm tra khách hàng có tồn tại trước khi thêm vào reservation_detail
DELIMITER $$
CREATE TRIGGER trg_check_customer_exists
BEFORE INSERT ON reservation_detail
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM customer
        WHERE customer_id = NEW.customer_id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer does not exist.';
    END IF;
END$$
DELIMITER ;

-- 5. Trigger giảm số lượng phòng còn lại sau khi đặt phòng
DELIMITER $$
CREATE TRIGGER trg_decrease_room_quantity
AFTER INSERT ON reservation
FOR EACH ROW
BEGIN
    UPDATE room_regulation
    SET room_quantity = room_quantity - 1
    WHERE room_type_id = (
        SELECT room_type_id FROM room WHERE id = NEW.room_id
    );
END$$
DELIMITER ;

-- 6. Trigger tạo báo cáo tự động khi tạo hóa đơn
DELIMITER $$
CREATE TRIGGER trg_add_report_on_receipt
AFTER INSERT ON receipt
FOR EACH ROW
BEGIN
    INSERT INTO report(admin_id, created_date, total_revenue, description)
    VALUES (
        NEW.receptionist_id,
        NEW.created_date,
        NEW.total_price,
        CONCAT('Auto report for receipt ID ', NEW.id)
    );
END$$
DELIMITER ;

-- 7. Trigger giới hạn số lượng khách trong một phòng
DELIMITER $$
CREATE TRIGGER trg_check_max_guests
BEFORE INSERT ON reservation_detail
FOR EACH ROW
BEGIN
    DECLARE v_max INT;
    DECLARE v_count INT;

    SELECT rr.capacity INTO v_max
    FROM reservation r
    JOIN room ro ON r.room_id = ro.id
    JOIN room_regulation rr ON ro.room_type_id = rr.room_type_id
    WHERE r.id = NEW.reservation_id;

    SELECT COUNT(*) INTO v_count
    FROM reservation_detail
    WHERE reservation_id = NEW.reservation_id;

    IF v_count >= v_max THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Maximum number of guests exceeded for this room.';
    END IF;
END$$
DELIMITER ;

-- 8. Trigger ghi log sau khi thanh toán thành công
DELIMITER $$
CREATE TRIGGER trg_log_payment_completed
AFTER UPDATE ON room_rental
FOR EACH ROW
BEGIN
    IF NEW.is_paid = 1 AND OLD.is_paid = 0 THEN
        INSERT INTO activity_log(user_id, action_type, action_description)
        VALUES (
            NEW.receptionist_id,
            'PAYMENT_COMPLETED',
            CONCAT('Payment completed for room rental ID ', NEW.id)
        );
    END IF;
END$$
DELIMITER ;
