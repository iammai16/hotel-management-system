use hoteldb;

CREATE USER 'customer_user'@'localhost' IDENTIFIED BY '12345678';
CREATE USER 'receptionist_user'@'localhost' IDENTIFIED BY '12345678';
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY '12345678';
-- CREATE USER 'accountant_user'@'localhost' IDENTIFIED BY '12345678';

-- Access control RECEPTIONIST
GRANT SELECT, INSERT, UPDATE ON hoteldb.reservation TO 'receptionist_user'@'localhost';
GRANT SELECT, INSERT ON hoteldb.reservation_detail TO 'receptionist_user'@'localhost';

GRANT SELECT, INSERT, UPDATE ON hoteldb.room_rental TO 'receptionist_user'@'localhost';
GRANT SELECT, INSERT ON hoteldb.room_rental_detail TO 'receptionist_user'@'localhost';

GRANT SELECT, INSERT ON hoteldb.room_service TO 'receptionist_user'@'localhost';
GRANT SELECT, INSERT ON hoteldb.receipt TO 'receptionist_user'@'localhost';
GRANT INSERT ON hoteldb.activity_log TO 'receptionist_user'@'localhost';

GRANT SELECT ON hoteldb.available_room TO 'receptionist_user'@'localhost';
GRANT SELECT ON hoteldb.guesthistory TO 'receptionist_user'@'localhost';

-- Access control for Manager
GRANT ALL PRIVILEGES ON hoteldb.* TO 'manager_user'@'localhost';

-- Access control for Accountant
/*
GRANT SELECT ON hoteldb.receipt TO 'accountant_user'@'localhost';
GRANT SELECT ON hoteldb.room_service TO 'accountant_user'@'localhost';
GRANT SELECT ON hoteldb.guesthistory TO 'accountant_user'@'localhost';*/ 

GRANT SELECT, INSERT ON hoteldb.report TO 'accountant_user'@'localhost';
GRANT SELECT ON hoteldb.reportlist TO 'accountant_user'@'localhost';

-- Access control for customer
GRANT INSERT ON hoteldb.reservation TO 'customer_user'@'localhost';
GRANT INSERT ON hoteldb.comment TO 'customer_user'@'localhost';
GRANT SELECT ON hoteldb.available_room TO 'customer_user'@'localhost';
FLUSH PRIVILEGES;