# Practical 01: JDBC Connection, Record Insertion, and Retrieval

## Practical Information
- Practical Number: 01
- Practical Title: Write a program to insert and retrieve the data from database using JDBC
- Aim: To understand JDBC connectivity and learn how to establish a connection between a Java application and a database for inserting and retrieving records.
- Technologies Used: Java (JDK 17 or higher), JDBC, MySQL, Maven

## Theory
Java Database Connectivity (JDBC) is a Java API that enables Java programs to connect with relational databases.
It works through five fundamental steps:
1. Load and Register the JDBC Driver class: `Class.forName("com.mysql.cj.jdbc.Driver")`.
2. Establish the Database Connection: `DriverManager.getConnection(url, username, password)`.
3. Create a Statement or PreparedStatement object to send SQL statements.
4. Execute the SQL Query:
   - Use `executeUpdate()` for INSERT, UPDATE, DELETE (returns the number of affected rows).
   - Use `executeQuery()` for SELECT (returns a `ResultSet`).
5. Process the Result and Close Resources: Process rows using `ResultSet.next()` and close all open connections.

## Files and Folder Structure
```
Practical_01/
├── pom.xml           - Maven configuration file containing MySQL Connector dependency
├── schema.sql        - SQL commands to create database and tables
├── README.md         - Documentation and execution guide
└── src/
    └── main/
        └── java/
            └── App.java - Main Java application with connection, insert, and select logic
```

## Source Code
### Important Classes and Methods in `App.java`:
- `getConnection()`: Loads MySQL JDBC driver `com.mysql.cj.jdbc.Driver` and connects to `jdbc:mysql://localhost:3306/mydb` using credentials.
- `insertData(Connection conn, String name, String email)`: Uses a `PreparedStatement` with parameterized placeholders (`?`) to safely insert user records into the `users` table.
- `retrieveData(Connection conn)`: Creates a `Statement` to execute `SELECT id, name, email FROM users` and iterates through the `ResultSet` to print each record.
- `main(String[] args)`: Orchestrates the database connection, inserts 6 sample student records, displays them, and safely closes the database connection.

## Database Setup
1. Start the MySQL service on your system or inside XAMPP/WAMP.
2. Open MySQL Workbench or MySQL Command Line Client.
3. Run the commands from `schema.sql`:
```sql
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```
4. Verify the database credentials in `App.java`:
   - URL: `jdbc:mysql://localhost:3306/mydb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
   - Username: `root`
   - Password: set to your MySQL root password (e.g., `root` or empty).

## How to Run

### Method 1: Using Eclipse IDE
1. Open Eclipse IDE.
2. Go to **File -> Open Projects from File System...**.
3. Click **Directory...**, browse to `d:\Workspace\Uni\EPJ\Prac\Practicals\Practical_01`, and click **Finish**.
4. Right-click on the project -> **Maven -> Update Project...** to download the MySQL Connector.
5. In `src/main/java/App.java`, update the database password on line 21 if needed.
6. Right-click `App.java` -> **Run As -> Java Application**.

### Method 2: Using Maven Command Line
1. Open terminal or command prompt in the `Practical_01` folder.
2. Compile the project:
   ```bash
   mvn clean compile
   ```
3. Run the application:
   ```bash
   mvn exec:java -Dexec.mainClass="App"
   ```

## Expected Output
```text
Success: Connected to the MySQL database!
Data successfully inserted for: Mumu
Data successfully inserted for: Rahul Kumar
Data successfully inserted for: Kumar
Data successfully inserted for: Abhishek
Data successfully inserted for: Hetvi
Data successfully inserted for: Anitha

--- Fetching Records From Database ---
ID: 1 | Name: Mumu | Email: mumu@sample.com
ID: 2 | Name: Rahul Kumar | Email: rahul@sample.com
ID: 3 | Name: Kumar | Email: rahul6@sample.com
ID: 4 | Name: Abhishek | Email: abhi@sample.com
ID: 5 | Name: Hetvi | Email: hetvi@sample.com
ID: 6 | Name: Anitha | Email: anitha@sample.com

Database connection closed safely.
```

## Testing
- Connection Test: Verified that `DriverManager.getConnection()` successfully returns a non-null Connection object when MySQL is running.
- Insertion Test: Verified that 6 insert statements execute and return row counts greater than 0.
- Retrieval Test: Verified that `ResultSet.next()` iterates over all rows and extracts `id`, `name`, and `email` columns accurately.
- Resource Cleanup Test: Verified that `Connection.close()` safely releases database sockets.

## Common Errors and Solutions
1. `ClassNotFoundException: com.mysql.cj.jdbc.Driver`
   - Cause: The MySQL JDBC driver JAR is missing from the classpath.
   - Solution: Ensure the `mysql-connector-j` dependency is present in `pom.xml`, and update Maven dependencies in Eclipse.
2. `CommunicationsLinkException: Communications link failure`
   - Cause: MySQL server is not running or listening on port 3306.
   - Solution: Start MySQL service from Windows Services or XAMPP Control Panel.
3. `Access denied for user 'root'@'localhost'`
   - Cause: Incorrect MySQL password.
   - Solution: Update the password variable in `App.java` to match your local MySQL root password.

## Viva Questions and Answers
1. **What is JDBC?**
   - JDBC stands for Java Database Connectivity. It is an API used in Java to connect and execute queries with relational databases.
2. **What is the purpose of `Class.forName()`?**
   - It loads the driver class dynamically into memory at runtime and registers it with the `DriverManager`.
3. **What is the difference between `Statement` and `PreparedStatement`?**
   - `Statement` is used for static SQL queries and compiles queries each time. `PreparedStatement` pre-compiles parameterized SQL queries, prevents SQL injection, and offers better performance.
4. **Which method is used to execute a SELECT query?**
   - `executeQuery()`, which returns a `ResultSet` object.
5. **Which method is used to execute an INSERT, UPDATE, or DELETE query?**
   - `executeUpdate()`, which returns an integer representing the number of rows affected.

## What I Must Remember
- Driver Class Name: `com.mysql.cj.jdbc.Driver`
- Connection URL format: `jdbc:mysql://<host>:<port>/<dbname>`
- Key Interfaces: `Connection`, `Statement`, `PreparedStatement`, `ResultSet`
- Return type of `executeQuery()`: `ResultSet`
- Return type of `executeUpdate()`: `int`
