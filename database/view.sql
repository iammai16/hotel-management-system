use hoteldb;

-- View 1: Phòng đang sẵn sàng
CREATE OR REPLACE VIEW hoteldb.available_room AS
SELECT 
    r.id AS room_id,
    r.name AS room_name,
    rt.name AS room_type,
    r.image
FROM hoteldb.room r
JOIN hoteldb.room_type rt ON r.room_type_id = rt.id
WHERE r.id NOT IN (
    SELECT room_id
    FROM hoteldb.room_rental
    WHERE checkout_date IS NULL OR is_paid = 0
);

-- View 2: Danh sách nhân viên
CREATE OR REPLACE VIEW hoteldb.employeelist AS
SELECT 
    id AS user_id,
    username,
    role,
    email,
    phone,
    gender,
    avatar
FROM hoteldb.user
WHERE role IN ('MANAGER', 'RECEPTIONIST', 'ACCOUNTANT', 'HOUSEKEEPER', 'SERVICESTAFF');

-- View 3: Lịch sử thuê phòng của khách
CREATE OR REPLACE VIEW hoteldb.guesthistory AS
SELECT 
    c.customer_id,
    c.name AS customer_name,
    rr.id AS rental_id,
    rr.checkin_date,
    rr.checkout_date,
    ro.name AS room_name,
    DATEDIFF(rr.checkout_date, rr.checkin_date) AS nights
FROM hoteldb.customer c
JOIN hoteldb.room_rental_detail rd ON c.customer_id = rd.customer_id
JOIN hoteldb.room_rental rr ON rd.room_rental_id = rr.id
JOIN hoteldb.room ro ON rr.room_id = ro.id;

-- View 4: Danh sách báo cáo doanh thu
CREATE OR REPLACE VIEW hoteldb.reportlist AS
SELECT 
    rp.id AS report_id,
    u.username AS admin_username,
    rp.created_date,
    rp.total_revenue,
    rp.description,
    MONTH(rp.created_date) AS report_month,
    YEAR(rp.created_date) AS report_year
FROM hoteldb.report rp
JOIN hoteldb.administrator a ON rp.admin_id = a.id
JOIN hoteldb.user u ON a.id = u.id;

-- View 5: Nhật ký hệ thống
CREATE OR REPLACE VIEW hoteldb.systemchangelogs AS
SELECT 
    al.id AS log_id,
    u.username,
    al.action_type,
    al.action_description,
    al.action_time
FROM hoteldb.activity_log al
JOIN hoteldb.user u ON al.user_id = u.id
ORDER BY al.action_time DESC;

-- View 6: Quy định loại phòng
CREATE OR REPLACE VIEW hoteldb.room_regulation_view AS
SELECT
    rr.id AS regulation_id,
    rt.name AS room_type_name,
    u.username AS admin_username,
    rr.room_quantity,
    rr.capacity,
    rr.price,
    rr.surcharge,
    rr.deposit_rate,
    rr.distance
FROM hoteldb.room_regulation rr
JOIN hoteldb.room_type rt ON rr.room_type_id = rt.id
JOIN hoteldb.administrator a ON rr.admin_id = a.id
JOIN hoteldb.user u ON u.id = a.id;

-- View 7: Hệ số loại khách hàng
CREATE OR REPLACE VIEW hoteldb.customer_type_regulation_view AS
SELECT
    ctr.id,
    u.username AS admin_username,
    ct.type AS customer_type,
    ctr.rate
FROM hoteldb.customer_type_regulation ctr
JOIN hoteldb.customer_type ct ON ctr.customer_type_id = ct.id
JOIN hoteldb.administrator a ON ctr.admin_id = a.id
JOIN hoteldb.user u ON u.id = a.id;

-- View 8: Báo cáo doanh thu theo tháng
CREATE OR REPLACE VIEW hoteldb.monthly_sale_statistic_view AS
SELECT
    rt.name AS room_type,
    MONTH(rp.created_date) AS month,
    YEAR(rp.created_date) AS year,
    COUNT(rp.id) AS receipt_count,
    SUM(rp.total_price) AS total_revenue
FROM hoteldb.receipt rp
JOIN hoteldb.room_rental rr ON rp.rental_room_id = rr.id
JOIN hoteldb.room r ON rr.room_id = r.id
JOIN hoteldb.room_type rt ON r.room_type_id = rt.id
GROUP BY rt.name, MONTH(rp.created_date), YEAR(rp.created_date)
ORDER BY year DESC, month DESC;

-- View 9: Báo cáo tần suất sử dụng phòng
CREATE OR REPLACE VIEW hoteldb.room_utilization_report_view AS
SELECT
    r.name AS room_name,
    COUNT(rr.id) AS rental_count,
    SUM(DATEDIFF(rr.checkout_date, rr.checkin_date)) AS total_days_rented
FROM hoteldb.room_rental rr
JOIN hoteldb.room r ON rr.room_id = r.id
GROUP BY r.name;

-- View 10: Danh sách dịch vụ và số lượng khách đang sử dụng mỗi dịch vụ
CREATE OR REPLACE VIEW hoteldb.service_usage_summary_view AS
SELECT
    s.id AS service_id,
    s.name AS service_name,
    s.price AS unit_price,
    COUNT(DISTINCT rrd.customer_id) AS current_customers_using,
    SUM(rs.quantity) AS total_quantity_used,
    SUM(rs.total_price) AS total_revenue_from_service
FROM hoteldb.room_service rs
JOIN hoteldb.service s ON rs.service_id = s.id
JOIN hoteldb.room_rental rr ON rs.room_rental_id = rr.id
JOIN hoteldb.room_rental_detail rrd ON rr.id = rrd.room_rental_id
GROUP BY s.id, s.name, s.price
ORDER BY total_revenue_from_service DESC;


--  View 11: Danh sách nhiệm vụ housekeeping và người thực hiện
CREATE OR REPLACE VIEW hoteldb.housekeeping_task_detailed_view AS
SELECT
    ht.id AS task_id,
    u.username AS housekeeper_username,
    u.email AS housekeeper_email,
    r.name AS room_name,
    ht.assigned_date,
    ht.completed_date,
    ht.status,
    ht.notes
FROM hoteldb.housekeeping_task ht
JOIN hoteldb.user u ON ht.housekeeper_id = u.id
JOIN hoteldb.room r ON ht.room_id = r.id
ORDER BY ht.assigned_date DESC;


