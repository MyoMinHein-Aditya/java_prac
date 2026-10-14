CREATE DATABASE IF NOT EXISTS springweb;
USE springweb;

CREATE TABLE IF NOT EXISTS employee (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255)
);

INSERT INTO employee (name, city) VALUES 
('Anitha Nadar', 'Vadodara'),
('Heer Parmar', 'Vadodara')
ON DUPLICATE KEY UPDATE city = VALUES(city);

SELECT * FROM employee;
