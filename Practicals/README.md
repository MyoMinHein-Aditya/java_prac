# Enterprise Programming Using Java (303105310)
## Complete Practical Laboratory Manual Implementations

- **Student Name:** Kalpataru Dash
- **Degree:** B.Tech. Computer Science & Engineering
- **Year / Semester:** Year 3 / Semester 5
- **University:** Parul University, Faculty of Engineering & Technology
- **Academic Year:** 2026 - 2027

---

## 1. Master Implementation Summary Table

| Practical | Title / Topic | Project Folder | Technologies & Tools | Completion Status | Testing Status | Primary Run Command / Entry Point |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Practical 01** | JDBC Connection, Insertion & Retrieval | `Practical_01` | Java 17, JDBC, MySQL, Maven | Completed | Verified Code & Schema | `App.java` (Run As Java Application) |
| **Practical 02** | PreparedStatement & ResultSet Interfaces | `Practical_02` | Java 17, JDBC, MySQL, Maven | Completed | Verified Code & Schema | `App.java` (Run As Java Application) |
| **Practical 03** | Servlet Programming, Request Details, Auth, Sessions, Cookies & Socket Chat | `Practical_03` | Java Servlets 4.0, Tomcat, Sockets, HTML/CSS, Maven | Completed | Verified Webapp & Sockets | Run on Tomcat / `ChatServer.java` & `ChatClient.java` |
| **Practical 04** | JSP Programming, Arithmetic, Forward, Implicit Objects & JDBC Login | `Practical_04` | JSP 2.3, JDBC, MySQL, Tomcat, HTML/CSS, Maven | Completed | Verified JSP Pages & Schema | Run on Tomcat (`index.html`) |
| **Practical 05** | Hibernate ORM CRUD Operations | `Practical_05` | Hibernate 5.6, JPA, MySQL, Maven | Completed | Verified Entity & Dialect | `n.a.w.App.java` (Run As Java Application) |
| **Practical 06** | Spring Boot REST CRUD Operations | `Practical_06` | Spring Boot 3.2.5, Spring Data JPA, REST, MySQL | Completed | Verified Spring Endpoints | `SpringCrudApplication.java` (Port 8082) |
| **Practical 07** | Spring Boot Web Application with Thymeleaf | `Practical_07` | Spring Boot 3.2.5, Spring MVC, Thymeleaf, JPA, MySQL | Completed | Verified Thymeleaf UI & Controller | `SpringBootWebAppApplication.java` (Port 8083) |

---

## 2. Practical Directory Index & Descriptions

### [Practical 01: JDBC Connection, Insertion, and Retrieval](./Practical_01/README.md)
- **Directory:** `Practical_01/`
- **Aim:** To understand JDBC connectivity and learn how to establish a connection between a Java application and a database for inserting and retrieving records.
- **Key Files:** `App.java`, `pom.xml`, `schema.sql`, `README.md`.
- **Database:** `mydb` | Table: `users`.
- **How to Run:** Import as Maven Project in Eclipse, right-click `App.java` -> **Run As -> Java Application**.

### [Practical 02: PreparedStatement and ResultSet Interfaces](./Practical_02/README.md)
- **Directory:** `Practical_02/`
- **Aim:** To demonstrate the use of PreparedStatement and ResultSet interfaces in JDBC for inserting and retrieving records from a MySQL database.
- **Key Files:** `App.java`, `pom.xml`, `schema.sql`, `README.md`.
- **Database:** `mydb` | Table: `users`.
- **How to Run:** Import in Eclipse, right-click `App.java` -> **Run As -> Java Application**.

### [Practical 03: Servlet Programming and Socket Chat Server](./Practical_03/README.md)
- **Directory:** `Practical_03/`
- **Aim:** To develop Servlet programs displaying HTTP request details, form handling, authentication, session tracking, cookie management; and implement a socket chat server using ServerSocket and Socket.
- **Key Files:**
  - Servlets: `MainServlet.java` (`/MainApp`), `RequestDetailsServlet.java` (`/request-details`), `HelloWorldServlet.java` (`/hello`), `CookieDemoServlet.java` (`/cookies`), `SessionTrackingServlet.java` (`/session`).
  - Web UI: `index.html` (Login Form), `Register.html` (Registration Form), `web.xml`.
  - Networking: `ChatServer.java` (ServerSocket on port 5000), `ChatClient.java` (Socket client).
- **How to Run:**
  - Web Servlets: Right-click project -> **Run As -> Run on Server** (Apache Tomcat).
  - Socket Chat: Run `ChatServer.java` as Java Application, then run `ChatClient.java` as Java Application.

### [Practical 04: JSP Programming and JDBC Integration](./Practical_04/README.md)
- **Directory:** `Practical_04/`
- **Aim:** To develop JSP programs performing arithmetic operations using scripting elements, demonstrating `<jsp:forward>` action tag, JSP implicit objects, and developing a JSP database authentication system using JDBC.
- **Key Files:**
  - `practical_4_1_arithmetic.jsp`: Arithmetic operations using `<% ... %>` and `<%= ... %>`.
  - `index.html` & `Request.jsp`: Glassmorphism login UI connecting to `demo_db` via JDBC.
  - `forward_demo.jsp` & `forward_target.jsp`: Demonstration of `<jsp:forward>`.
  - `implicit_objects.jsp`: Demonstration of 9 implicit objects.
  - `insert_user.jsp`: Direct JDBC insertion via JSP form.
  - `schema.sql`: Database scripts for `demo_db`.
- **How to Run:** Run on Apache Tomcat in Eclipse, open `http://localhost:8080/Practical_04/index.html`.

### [Practical 05: Hibernate ORM CRUD Operations](./Practical_05/README.md)
- **Directory:** `Practical_05/`
- **Aim:** Create Application to store the data in database to perform Hibernate CRUD operation.
- **Key Files:** `Employee.java`, `App.java`, `hibernate.cfg.xml`, `pom.xml`, `schema.sql`, `README.md`.
- **Database:** `TestHibernate` | Table: `employee`.
- **How to Run:** Ensure `TestHibernate` database exists in MySQL, right-click `n.a.w.App.java` -> **Run As -> Java Application**.

### [Practical 06: Spring Boot REST CRUD Operations](./Practical_06/README.md)
- **Directory:** `Practical_06/`
- **Aim:** Create Application to store the data in database to perform Spring CRUD operation.
- **Key Files:**
  - `Employee.java`, `EmployeeRepository.java`, `EmployeeService.java`, `EmployeeController.java`.
  - `SpringCrudApplication.java`, `application.properties`, `index.html` (Interactive web test dashboard).
- **Port:** `8082` | **Database:** `springcrud`.
- **How to Run:** Right-click `SpringCrudApplication.java` -> **Run As -> Java Application**, navigate to `http://localhost:8082/` in any browser.

### [Practical 07: Spring Boot Web Application with Thymeleaf](./Practical_07/README.md)
- **Directory:** `Practical_07/`
- **Aim:** Create a web application to store the data in database with spring boot.
- **Key Files:**
  - `Employee.java`, `EmployeeRepository.java`, `EmployeeController.java`.
  - `SpringBootWebAppApplication.java`, `application.properties`, `employees.html` (Thymeleaf UI).
- **Port:** `8083` | **Database:** `springweb`.
- **How to Run:** Right-click `SpringBootWebAppApplication.java` -> **Run As -> Java Application**, open `http://localhost:8083/` in your browser.

---

## 3. General Setup Instructions for Eclipse IDE

1. **Install Prerequisites:**
   - Java Development Kit (JDK 17 or higher)
   - MySQL Server 8.0+ (via standalone MySQL, MySQL Workbench, or XAMPP)
   - Eclipse IDE for Enterprise Java and Web Developers
   - Apache Tomcat 9 or 10 (configured inside Eclipse Servers runtime)
2. **Import Any Practical into Eclipse:**
   - Go to **File -> Open Projects from File System...**.
   - Click **Directory...** and select the practical folder (e.g., `Practical_01`).
   - Click **Finish**.
   - Right-click project -> **Maven -> Update Project...** (this downloads all driver and framework libraries automatically).
3. **Database Configuration:**
   - Open MySQL Workbench and execute the `schema.sql` file located inside the respective practical folder.
   - Adjust the MySQL `root` password in `App.java` (for Practicals 1, 2), `Request.jsp` (for Practical 4), `hibernate.cfg.xml` (for Practical 5), or `application.properties` (for Practicals 6, 7).
