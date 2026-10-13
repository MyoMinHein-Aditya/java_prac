# Practical 04: JSP Programming and JDBC Integration

## Practical Information
- Practical Number: 04
- Practical Title: JSP Programming (Arithmetic Operations, Forward Action Tag, Implicit Objects, and Database Authentication via JDBC)
- Aim: To develop JSP programs that perform basic arithmetic operations using JSP scripting elements; demonstrate `<jsp:forward>` action tag and JSP implicit objects; and develop a JSP web application that connects to a database using JDBC for user authentication and record insertion.
- Technologies Used: Java Server Pages (JSP 2.3), Java Servlets (4.0), JDBC, MySQL Database, Apache Tomcat, HTML5, CSS3, Maven

## Theory
### 1. JSP Scripting Elements
- Scriptlet Tag `<% ... %>`: Contains valid Java statements executed when the request is processed.
- Expression Tag `<%= ... %>`: Evaluates an expression, converts the result into a String, and writes it directly to the response output stream without needing a semicolon.
- Declaration Tag `<%! ... %>`: Declares instance variables and methods at the class level.
- Directive Tag `<%@ ... %>`: Provides global instructions to the JSP container (e.g., `<%@ page import="java.sql.*" %>`).

### 2. JSP Action Tags
- `<jsp:forward page="target.jsp">`: Forwards the request and response objects to another resource on the server side without making a round-trip to the client browser.
- `<jsp:param name="key" value="value" />`: Passes additional parameters during forward or include operations.

### 3. JSP Implicit Objects
JSP engines automatically expose 9 implicit objects in every JSP page:
- `request` (`HttpServletRequest`)
- `response` (`HttpServletResponse`)
- `out` (`JspWriter`)
- `session` (`HttpSession`)
- `application` (`ServletContext`)
- `config` (`ServletConfig`)
- `pageContext` (`PageContext`)
- `page` (`Object`)
- `exception` (`Throwable`)

## Files and Folder Structure
```
Practical_04/
├── pom.xml                                - Maven configuration with JSP and MySQL dependencies
├── schema.sql                             - Database and table creation script for demo_db
├── README.md                              - Complete documentation
└── src/
    └── main/
        └── webapp/
            ├── index.html                 - Glassmorphic login page submitting to Request.jsp
            ├── Request.jsp                - JDBC user authentication, session count, and cookie logic
            ├── practical_4_1_arithmetic.jsp - Practical 4.1 Arithmetic operations using JSP elements
            ├── forward_demo.jsp           - Demonstrates <jsp:forward> action tag
            ├── forward_target.jsp         - Target page receiving forwarded parameters
            ├── implicit_objects.jsp       - Demonstrates all 9 JSP implicit objects
            ├── insert_user.jsp            - Form and JDBC logic to insert records into database
            └── WEB-INF/
                └── web.xml                - Web application deployment descriptor
```

## Source Code
### 1. `practical_4_1_arithmetic.jsp`
Demonstrates basic arithmetic expressions in JSP:
```jsp
<%
    int num1 = 20; 
    int num2 = 5;
    int sum = num1 + num2; 
    int diff = num1 - num2;
    int product = num1 * num2; 
    int quotient = num1 / num2;
%>
<p>Addition (20 + 5): <strong><%= sum %></strong></p>
<p>Subtraction (20 - 5): <strong><%= diff %></strong></p>
<p>Multiplication (20 * 5): <strong><%= product %></strong></p>
<p>Division (20 / 5): <strong><%= quotient %></strong></p>
```

### 2. `Request.jsp`
Connects to `demo_db` and verifies user credentials using `PreparedStatement`:
```jsp
String sql = "SELECT * FROM users WHERE username=? AND password=?";
ps = con.prepareStatement(sql);
ps.setString(1, user);
ps.setString(2, pass);
rs = ps.executeQuery();
if (rs.next()) {
    // Increment session visit counter
    Integer count = (Integer) session.getAttribute("count");
    count = (count == null) ? 1 : count + 1;
    session.setAttribute("count", count);

    // Save cookie
    Cookie ck = new Cookie("username", user);
    ck.setMaxAge(3600);
    response.addCookie(ck);
}
```

## Database Setup
1. Start your MySQL database server.
2. Run the SQL script from `schema.sql`:
```sql
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
('anitha', '123456');
```
3. Update the MySQL password in `Request.jsp` (line 46) and `insert_user.jsp` (line 40) to match your local password.

## How to Run

### Method 1: Using Eclipse IDE
1. Open Eclipse IDE.
2. Choose **File -> Open Projects from File System...**.
3. Browse to `d:\Workspace\Uni\EPJ\Prac\Practicals\Practical_04` and click **Finish**.
4. Right-click project -> **Run As -> Run on Server**.
5. Select Apache Tomcat and click **Finish**.
6. Access in your browser:
   - Login System: `http://localhost:8080/Practical_04/index.html`
   - Arithmetic 4.1: `http://localhost:8080/Practical_04/practical_4_1_arithmetic.jsp`
   - Forward Action: `http://localhost:8080/Practical_04/forward_demo.jsp`
   - Implicit Objects: `http://localhost:8080/Practical_04/implicit_objects.jsp`
   - Insert Record: `http://localhost:8080/Practical_04/insert_user.jsp`

## Expected Output

### 1. Arithmetic JSP (Practical 4.1):
```text
Hello World!
Simple Arithmetic Operations
First Number        : 20
Second Number       : 5
Addition (20 + 5)   : 25
Subtraction (20 - 5): 15
Multiplication (20 * 5): 100
Division (20 / 5)   : 4
```

### 2. Login Result (Practical 4.2):
When logging in with username `admin` and password `1234`:
```text
Login Successful
Welcome admin
Session ID : 3D68A1B02C931E54972
Visit Count : 1
Cookie Created Successfully.
[Logout]
```
When logging in with wrong password:
```text
Login Failed
Invalid Username or Password
[Try Again]
```

## Testing
- Arithmetic Operations Test: Verified that 20+5=25, 20-5=15, 20*5=100, 20/5=4 are calculated and output correctly.
- Database Connection Test: Verified that `DriverManager.getConnection()` connects to `demo_db` on port 3306.
- Authentication Query Test: Verified that `SELECT * FROM users WHERE username=? AND password=?` finds sample credentials `admin` / `1234`.
- Session & Cookie Test: Verified that `session.setAttribute("count", ...)` maintains state and `Cookie("username", ...)` is added to HTTP response header.
- Forward Tag Test: Verified that `forward_demo.jsp` forwards parameters without URL change.

## Common Errors and Solutions
1. `CommunicationsLinkException` in `Request.jsp`
   - Cause: MySQL server is stopped or database `demo_db` is missing.
   - Solution: Start MySQL and execute `schema.sql`.
2. `JasperException: Unable to compile class for JSP`
   - Cause: Syntax error inside `<% ... %>` scriptlet tag or missing import directive.
   - Solution: Verify all Java statements end with a semicolon and imports like `<%@ page import="java.sql.*" %>` are declared.
3. Password authentication fails in `Request.jsp`
   - Cause: Database password in code (`root`) does not match local MySQL root password.
   - Solution: Adjust `String dbPass = "yourPassword";` on line 46 in `Request.jsp`.

## Viva Questions and Answers
1. **What is the difference between Servlets and JSP?**
   - Servlets are Java classes that output HTML (Java code containing HTML). JSP is HTML documents containing embedded Java code (HTML containing Java).
2. **What are the lifecycle phases of a JSP page?**
   - Translation, Compilation, Loading, Instantiation, Initialization (`jspInit()`), Execution (`_jspService()`), and Destruction (`jspDestroy()`).
3. **What is the difference between `<%@ include %>` directive and `<jsp:include>` action?**
   - The directive `<%@ include file="..." %>` includes file content at translation time (static). The action `<jsp:include page="..." />` includes output at request time (dynamic).
4. **Name 5 implicit objects in JSP.**
   - `request`, `response`, `out`, `session`, and `application`.
5. **How does `<jsp:forward>` differ from `response.sendRedirect()`?**
   - `<jsp:forward>` executes entirely on the server side without a round trip to client (URL does not change). `response.sendRedirect()` instructs the client browser to make a new HTTP request (URL changes).

## What I Must Remember
- Scriptlet tag: `<% Java code; %>`
- Expression tag: `<%= expression %>` (no semicolon allowed)
- Directive tag: `<%@ directive attribute="value" %>`
- Forward tag: `<jsp:forward page="target.jsp" />`
- Default scriptlet implicit output object: `out` (`JspWriter`)
