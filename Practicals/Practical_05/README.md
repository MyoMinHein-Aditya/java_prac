# Practical 05: Hibernate CRUD Operations

## Practical Information
- Practical Number: 05
- Practical Title: Create Application to store the data in database to perform Hibernate CRUD operation
- Aim: To create a Java application using Hibernate ORM framework to connect to a MySQL database and perform CRUD (Create, Read, Update, Delete) operations on an Employee entity.
- Technologies Used: Java (JDK 17 or higher), Hibernate ORM (5.6.15.Final), JPA Annotations, MySQL Database, Maven

## Theory
### 1. Object-Relational Mapping (ORM)
ORM is a programming technique that maps Java domain model classes (Objects) to relational database tables. It eliminates boilerplate JDBC SQL queries and handles object state persistence automatically.

### 2. Core Hibernate Architecture Interfaces
- `Configuration`: Reads the `hibernate.cfg.xml` configuration file and builds the `SessionFactory`.
- `SessionFactory`: Heavyweight, thread-safe object used to open client database sessions. Usually one per database application.
- `Session`: Lightweight, single-threaded connection interface providing methods like `save()`, `get()`, `update()`, and `delete()`.
- `Transaction`: Represents an atomic unit of database work. Commits changes via `commit()` or undoes them via `rollback()`.
- `Query` / HQL: Hibernate Query Language allows querying objects rather than database tables.

### 3. JPA Annotations Used
- `@Entity`: Marks the class as a persistent database entity.
- `@Table(name = "employee")`: Specifies the underlying table name.
- `@Id`: Marks the primary key field.
- `@GeneratedValue(strategy = GenerationType.IDENTITY)`: Configures database auto-increment identity generation.

## Files and Folder Structure
```
Practical_05/
├── pom.xml                                  - Maven dependencies (Hibernate Core, MySQL Connector, JPA)
├── schema.sql                               - Database setup script for TestHibernate
├── README.md                                - Complete documentation and guide
└── src/
    └── main/
        ├── java/
        │   └── n/
        │       └── a/
        │           └── w/
        │               ├── Employee.java    - JPA Entity representing employee table
        │               └── App.java         - Main application performing Hibernate CRUD
        └── resources/
            └── hibernate.cfg.xml            - Hibernate connection and dialect configuration
```

## Source Code
### 1. Configuration loading in `App.java`:
```java
Configuration cfg = new Configuration();
cfg.configure("hibernate.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
```

### 2. Create Operation:
```java
Session session = sf.openSession();
Transaction tr = session.beginTransaction();
Employee e01 = new Employee();
e01.setEmp_fname("Anitha");
e01.setEmp_lname("Nadar");
e01.setEmp_city("Gujarat");
session.save(e01);
tr.commit();
session.close();
```

### 3. Read Operation (HQL):
```java
List<Employee> list = session.createQuery("from Employee", Employee.class).list();
```

### 4. Update Operation:
```java
Employee emp = session.get(Employee.class, id);
emp.setEmp_city("Vadodara");
session.update(emp);
```

## Database Setup
1. Start your MySQL database server.
2. Create the database using MySQL Workbench or CLI:
```sql
CREATE DATABASE IF NOT EXISTS TestHibernate;
USE TestHibernate;
```
3. Hibernate will automatically generate the `employee` table when `hibernate.hbm2ddl.auto` is set to `update`.
4. In `src/main/resources/hibernate.cfg.xml`, set your MySQL root password:
```xml
<property name="connection.password">root</property>
```

## How to Run

### Method 1: Using Eclipse IDE
1. Open Eclipse IDE.
2. Select **File -> Open Projects from File System...**.
3. Choose directory: `d:\Workspace\Uni\EPJ\Prac\Practicals\Practical_05`.
4. Right-click project -> **Maven -> Update Project...**.
5. Right-click `src/main/java/n/a/w/App.java` -> **Run As -> Java Application**.

### Method 2: Using Maven Command Line
1. Open terminal in the `Practical_05` directory.
2. Compile project:
   ```bash
   mvn clean compile
   ```
3. Execute:
   ```bash
   mvn exec:java -Dexec.mainClass="n.a.w.App"
   ```

## Expected Output
```text
INFO: HHH000412: Hibernate ORM core version 5.6.15.Final
INFO: HHH000401: using driver [com.mysql.cj.jdbc.Driver] at URL [jdbc:mysql://localhost:3306/TestHibernate]
Hibernate: create table if not exists employee (emp_id integer not null auto_increment, emp_city varchar(255), emp_fname varchar(255), emp_lname varchar(255), primary key (emp_id)) engine=InnoDB
Hibernate: insert into employee (emp_city, emp_fname, emp_lname) values (?, ?, ?)
Data stored successfully! Generated ID: 1

--- Fetching All Employees from TestHibernate ---
Employee [emp_id=1, emp_fname=Anitha, emp_lname=Nadar, emp_city=Gujarat]

Hibernate: update employee set emp_city=?, emp_fname=?, emp_lname=? where emp_id=?
Employee ID 1 city updated to Vadodara.

Hibernate SessionFactory closed safely.
```

## Testing
- Configuration Test: Verified that `hibernate.cfg.xml` is located on the classpath and parsed cleanly.
- Entity Mapping Test: Verified that `@Entity` annotations on `Employee.java` generate the matching table in MySQL.
- Transaction Test: Verified that `session.beginTransaction()` and `tr.commit()` commit rows atomically to the database.
- Auto DDL Test: Verified that `hibernate.hbm2ddl.auto=update` generates the schema without dropping existing records.

## Common Errors and Solutions
1. `HibernateConfigException / MappingException: Unknown entity: n.a.w.Employee`
   - Cause: Entity mapping tag `<mapping class="n.a.w.Employee"/>` missing inside `hibernate.cfg.xml`.
   - Solution: Ensure the mapping class tag is present inside `<session-factory>`.
2. `CommunicationsLinkException: Connection refused`
   - Cause: MySQL is not running on port 3306.
   - Solution: Start MySQL service and verify port 3306 is open.
3. Hardcoded path error `FileNotFoundException: /h/t/a/hibernate.cfg.xml`
   - Cause: The manual contained an absolute folder path specific to the author's local drive (`/h/t/a/`).
   - Solution: We placed `hibernate.cfg.xml` inside `src/main/resources/` and called `cfg.configure("hibernate.cfg.xml")`, which loads portably from any system classpath.

## Viva Questions and Answers
1. **What is Hibernate?**
   - Hibernate is an open-source, lightweight Object-Relational Mapping (ORM) framework for Java that simplifies database operations by mapping Java classes to database tables.
2. **What is the difference between `openSession()` and `getCurrentSession()`?**
   - `openSession()` always creates a new physical database session that must be explicitly closed. `getCurrentSession()` returns the session bound to the current thread context.
3. **What is the purpose of `SessionFactory`?**
   - It is a thread-safe factory responsible for creating `Session` objects and caching database metadata.
4. **What does `hbm2ddl.auto` do?**
   - It automatically generates or updates the database schema based on entity mappings. Common values are `validate`, `update`, `create`, and `create-drop`.
5. **What is HQL?**
   - Hibernate Query Language. It is an object-oriented query language similar to SQL, but it queries entity class names and property names instead of database table and column names.

## What I Must Remember
- Configuration object: `new Configuration().configure()`
- Session creation: `sf.openSession()`
- Save entity: `session.save(object)`
- Commit changes: `transaction.commit()`
- Primary Key annotation: `@Id`
- Auto ID generation: `@GeneratedValue(strategy = GenerationType.IDENTITY)`
