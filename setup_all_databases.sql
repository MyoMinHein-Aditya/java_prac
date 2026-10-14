CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

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

CREATE DATABASE IF NOT EXISTS TestHibernate;
USE TestHibernate;

CREATE TABLE IF NOT EXISTS employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_fname VARCHAR(255),
    emp_lname VARCHAR(255),
    emp_city VARCHAR(255)
);

CREATE DATABASE IF NOT EXISTS springcrud;
USE springcrud;

CREATE TABLE IF NOT EXISTS employee (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255)
);

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
