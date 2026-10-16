-- =============================================================================
--  database/init.sql - Khởi tạo dữ liệu cho đề 007: Quản lý vé xe khách
--  MySQL tự chạy file này ở LẦN KHỞI ĐỘNG ĐẦU TIÊN khi được mount vào
--  /docker-entrypoint-initdb.d/  (database và user do biến MYSQL_* tạo sẵn)
-- =============================================================================
SET NAMES utf8mb4;

USE ptit_ticket_db;

CREATE TABLE IF NOT EXISTS tickets (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    ticket_code     VARCHAR(20) NOT NULL,
    passenger_name  VARCHAR(100) NOT NULL,
    route           VARCHAR(100) NOT NULL,
    departure_date  DATE NOT NULL,
    seat            VARCHAR(10) NOT NULL,
    price           DECIMAL(12,2) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO tickets (ticket_code, passenger_name, route, departure_date, seat, price) VALUES
    ('VX-0001', 'Nguyễn Văn An', 'Hà Nội - Hải Phòng', '2026-12-20', 'A01', 180000),
    ('VX-0002', 'Trần Thị Bình', 'Hà Nội - Nam Định', '2026-12-20', 'A02', 150000),
    ('VX-0003', 'Lê Văn Cường', 'Hà Nội - Thanh Hóa', '2026-12-21', 'B05', 220000),
    ('VX-0004', 'Phạm Thị Dung', 'Hà Nội - Lào Cai', '2026-12-21', 'B07', 350000),
    ('VX-0005', 'Hoàng Văn Em', 'Hà Nội - Quảng Ninh', '2026-12-22', 'C03', 250000),
    ('VX-0006', 'Vũ Thị Giang', 'Hà Nội - Ninh Bình', '2026-12-22', 'C04', 160000),
    ('VX-0007', 'Đỗ Văn Hùng', 'Hà Nội - Vinh', '2026-12-23', 'D10', 380000),
    ('VX-0008', 'Ngô Thị Lan', 'Hà Nội - Hải Phòng', '2026-12-23', 'D11', 180000);
