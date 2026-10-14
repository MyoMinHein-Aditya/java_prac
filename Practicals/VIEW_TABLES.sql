-- =====================================================================
-- MASTER SQL SCRIPT: VIEW ALL PRACTICAL DATABASES AND TABLES
-- Student: Kalpataru Dash
-- Subject: Enterprise Programming Using Java (303105310)
-- =====================================================================

-- 1. PRACTICAL 01 & 02 DATABASE (mydb)
USE mydb;
SHOW TABLES;
DESCRIBE users;
SELECT * FROM users;

-- 2. PRACTICAL 04 DATABASE (demo_db)
USE demo_db;
SHOW TABLES;
DESCRIBE users;
SELECT * FROM users;

-- 3. PRACTICAL 05 DATABASE (TestHibernate)
USE TestHibernate;
SHOW TABLES;
DESCRIBE employee;
SELECT * FROM employee;

-- 4. PRACTICAL 06 DATABASE (springcrud)
USE springcrud;
SHOW TABLES;
DESCRIBE employee;
SELECT * FROM employee;

-- 5. PRACTICAL 07 DATABASE (springweb)
USE springweb;
SHOW TABLES;
DESCRIBE employee;
SELECT * FROM employee;
