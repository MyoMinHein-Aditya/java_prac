# Java Practicals Execution Guide (Copy-Paste Ready)

- **Student Name:** Kalpataru Dash
- **Subject:** Enterprise Programming Using Java (303105310)
- **MySQL Configuration:** Port `3306` | User: `root` | Password: `Dash@1908`

---

## Practical 01: JDBC Insertion and Retrieval

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_01"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" compile exec:java
```

- **Output:** Connects to MySQL `mydb`, inserts user `Kalpataru Dash`, displays all user records in terminal, and exits.

---

## Practical 02: PreparedStatement & ResultSet

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_02"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" compile exec:java
```

- **Output:** Uses `PreparedStatement` to insert records, queries via `ResultSet`, prints all records, and closes connection.

---

## Practical 03: Socket Chat & Servlets

### Part A: Socket Chat Server (Port 5000)
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_03"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" test-compile exec:java
```

### Part B: Socket Chat Client (Run in a New Terminal Window)
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_03"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" test-compile "exec:java" "-Dexec.mainClass=com.chat.ChatClient"
```
*(Type messages between Server and Client in real-time. Type `bye` to disconnect).*

### Part C: Servlets (Web Browser via Port 8085)
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_03"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" jetty:run
```
- **Login Page:** http://localhost:8085/Practical_03/index.html (Login: `admin` / `1234`)
- **Register Form:** http://localhost:8085/Practical_03/Register.html
- **Hello Servlet:** http://localhost:8085/Practical_03/hello
- **Session Tracking:** http://localhost:8085/Practical_03/session
- **Cookies Demo:** http://localhost:8085/Practical_03/cookies
- **Request Details:** http://localhost:8085/Practical_03/request-details
- *(Press `Ctrl + C` in PowerShell to stop the server).*

---

## Practical 04: JSP Programming & JDBC Integration (Port 8086)

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_04"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" jetty:run
```
- **Login Page:** http://localhost:8086/Practical_04/index.html (Test Login: `admin` / `1234`)
- **Add User Form (JDBC):** http://localhost:8086/Practical_04/insert_user.jsp
- **Arithmetic Demo:** http://localhost:8086/Practical_04/practical_4_1_arithmetic.jsp
- **Implicit Objects:** http://localhost:8086/Practical_04/implicit_objects.jsp
- *(Press `Ctrl + C` in PowerShell to stop the server).*

---

## Practical 05: Hibernate ORM CRUD Operations

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_05"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" compile exec:java
```
- **Output:** Reads `hibernate.cfg.xml`, connects to MySQL `TestHibernate`, saves employee `Kalpataru Dash`, displays all employees, and exits with `BUILD SUCCESS`.

---

## Practical 06: Spring Boot REST CRUD (Port 8082)

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_06"
java -jar "target\SpringCRUD-0.0.1-SNAPSHOT.jar"
```
- **Browser URL:** http://localhost:8082/
- **Output:** Web page to add new employee, view employee records table, and delete records live from MySQL `springcrud`.
- *(Press `Ctrl + C` in PowerShell to stop).*

---

## Practical 07: Spring Boot Thymeleaf Web App (Port 8083)

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_07"
java -jar "target\SpringBootWebApp-0.0.1-SNAPSHOT.jar"
```
- **Browser URL:** http://localhost:8083/
- **Output:** Web UI to add and delete employees using Thymeleaf template connected to MySQL `springweb`.
- *(Press `Ctrl + C` in PowerShell to stop).*
