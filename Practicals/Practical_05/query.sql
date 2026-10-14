CREATE DATABASE IF NOT EXISTS TestHibernate;
USE TestHibernate;

CREATE TABLE IF NOT EXISTS employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_fname VARCHAR(255),
    emp_lname VARCHAR(255),
    emp_city VARCHAR(255)
);

SELECT * FROM employee;
