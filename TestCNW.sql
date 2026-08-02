CREATE DATABASE IF NOT EXISTS TestCNW;
USE TestCNW;

CREATE TABLE IF NOT EXISTS User (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Khoa (
    ma_khoa VARCHAR(20) PRIMARY KEY,
    ten_khoa VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS SinhVien (
    ma_sv VARCHAR(20) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    gioi_tinh TINYINT(1) NOT NULL COMMENT '1: Nam, 0: Nu',
    ma_khoa VARCHAR(20),
    FOREIGN KEY (ma_khoa) REFERENCES Khoa(ma_khoa)
);

-- Insert dummy data
INSERT INTO User (username, password) VALUES ('admin', '123456');

INSERT INTO Khoa (ma_khoa, ten_khoa) VALUES 
('K01', 'Khoa Toán'),
('K02', 'Khoa Hóa'),
('K03', 'Khoa Lý'),
('K04', 'Khoa Công nghệ thông tin');

INSERT INTO SinhVien (ma_sv, ho_ten, gioi_tinh, ma_khoa) VALUES 
('1051010565', 'Lý Lê Bằng', 1, 'K01'),
('1051016523', 'Trần Anh Tuấn', 1, 'K01'),
('1051036666', 'Lê Lan Anh', 0, 'K02'),
('1051037777', 'Đặng Thúy Nga', 0, 'K03'),
('1051070388', 'Nguyễn Văn A', 1, 'K04'),
('1051070584', 'Trần Văn Long', 1, 'K04'),
('1051072354', 'Lê Văn Nam', 1, 'K04');

