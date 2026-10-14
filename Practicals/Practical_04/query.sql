CREATE DATABASE IF NOT EXISTS demo_db;
USE demo_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

INSERT INTO users (username, password) VALUES 
('admin', '1234'),
('john_doe', 'secret123'),
('anitha', '123456')
ON DUPLICATE KEY UPDATE password = VALUES(password);

SELECT * FROM users;
