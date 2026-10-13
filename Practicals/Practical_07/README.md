# Practical 07: Spring Boot Web Application with Thymeleaf

## Practical Information
- Practical Number: 07
- Practical Title: Create a web application to store the data in database with spring boot
- Aim: To build a complete Spring Boot MVC web application integrated with Thymeleaf frontend template engine and MySQL database to manage and store employee records.
- Technologies Used: Spring Boot 3.2.5, Spring MVC, Thymeleaf, Spring Data JPA, Hibernate, MySQL Database, Maven

## Theory
### 1. Spring MVC Pattern
Model-View-Controller separates application concerns:
- **Model**: Encapsulates application data and passes it to the view (`org.springframework.ui.Model`).
- **View**: Renders UI to the client using Thymeleaf HTML templates.
- **Controller**: `@Controller` maps incoming HTTP browser requests (`@GetMapping`, `@PostMapping`), manipulates the model, and selects the view template.

### 2. Thymeleaf Template Engine
Thymeleaf is a modern server-side Java template engine for web environments. It integrates with Spring MVC and processes HTML with natural templates:
- `th:each="item : ${collection}"`: Iterates over collections.
- `th:text="${item.property}"`: Replaces element content with property evaluation.
- `th:href="@{/path}"`: Evaluates context-relative URL paths.

### 3. Redirect Attributes
Returning `"redirect:/"` follows the Post-Redirect-Get (PRG) pattern, preventing duplicate form submissions when users refresh the browser.

## Files and Folder Structure
```
Practical_07/
├── pom.xml                                               - Maven dependencies (Web, Data JPA, Thymeleaf, MySQL)
├── schema.sql                                            - SQL database setup for springweb
├── README.md                                             - Documentation and execution guide
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── springweb/
        │           ├── SpringBootWebAppApplication.java  - Application main class
        │           ├── entity/
        │           │   └── Employee.java                 - JPA entity mapped to employee table
        │           ├── repository/
        │           │   └── EmployeeRepository.java       - Spring Data JPA CRUD repository
        │           └── controller/
        │               └── EmployeeController.java       - MVC Controller handling web requests
        └── resources/
            ├── application.properties                    - Application config and port 8083
            └── templates/
                └── employees.html                        - Thymeleaf HTML template with form and table
```

## Source Code
### 1. MVC Controller (`EmployeeController.java`):
- `GET /` : Loads all records using `repository.findAll()`, attaches them to `Model` as `"employees"`, and returns the `"employees"` view template.
- `POST /save` : Captures the submitted `Employee` form object, saves it with `repository.save(employee)`, and redirects back to `"redirect:/"`.
- `GET /delete/{id}` : Deletes an employee by ID and redirects back to `"redirect:/"`.

### 2. Thymeleaf Template (`employees.html`):
- Form to add new employee:
  ```html
  <form action="/save" method="post">
      <input type="text" name="name" required>
      <input type="text" name="city" required>
      <button type="submit">Save Employee</button>
  </form>
  ```
- Dynamic table rendering:
  ```html
  <tr th:each="employee : ${employees}">
      <td th:text="${employee.id}"></td>
      <td th:text="${employee.name}"></td>
      <td th:text="${employee.city}"></td>
  </tr>
  ```

## Database Setup
1. Start MySQL database server.
2. Execute setup SQL from `schema.sql`:
```sql
CREATE DATABASE IF NOT EXISTS springweb;
USE springweb;
```
3. Set your MySQL root password inside `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/springweb
spring.datasource.username=root
spring.datasource.password=root
server.port=8083
```

## How to Run

### Method 1: Using Eclipse IDE
1. Open Eclipse IDE.
2. Select **File -> Open Projects from File System...**.
3. Choose directory: `d:\Workspace\Uni\EPJ\Prac\Practicals\Practical_07` and click **Finish**.
4. Right-click project -> **Maven -> Update Project...**.
5. Right-click `SpringBootWebAppApplication.java` -> **Run As -> Java Application**.
6. Open your web browser and navigate to: `http://localhost:8083/`.

### Method 2: Using Maven Command Line
1. Open terminal in the `Practical_07` directory.
2. Start the application:
   ```bash
   mvn spring-boot:run
   ```
3. Open `http://localhost:8083/` in your browser.

## Expected Output

### 1. Web Page Display (`http://localhost:8083/`):
```text
Employee Management System
Add Employee
Name: [ Anitha Nadar   ]
City: [ Vadodara       ]
[Save Employee]

-------------------------------------------------
Employee Records
ID    Name            City        Action
1     Anitha Nadar    Vadodara    [Delete]
2     Heer Parmar     Vadodara    [Delete]
```

### 2. Database Verification in MySQL:
```sql
mysql> SELECT * FROM springweb.employee;
+----+--------------+----------+
| id | name         | city     |
+----+--------------+----------+
|  1 | Anitha Nadar | Vadodara |
|  2 | Heer Parmar  | Vadodara |
+----+--------------+----------+
2 rows in set (0.00 sec)
```

## Testing
- Web Rendering Test: Navigated to `http://localhost:8083/` and verified that the page renders the Add Employee form and table with no template parse errors.
- Form Submission Test: Submitted form with name "Myo Min Hein" and city "Vadodara". Confirmed record was saved in MySQL and table immediately displayed the new row.
- Database Synchronization Test: Inspected MySQL table `springweb.employee` to verify auto-increment ID generation and column persistence.
- Deletion Test: Clicked delete link on an employee ID; confirmed entity was deleted from database and page reloaded smoothly.

## Common Errors and Solutions
1. `Port 8083 is already in use`
   - Cause: Another application or older instance of SpringBootWebApp is active.
   - Solution: Terminate the active process or adjust `server.port=8085` in `application.properties`.
2. `TemplateInputException: Error resolving template [employees]`
   - Cause: `employees.html` was saved outside `src/main/resources/templates/`.
   - Solution: Keep all HTML templates inside `src/main/resources/templates/` folder.
3. `Unknown database 'springweb'`
   - Cause: MySQL database has not been created yet.
   - Solution: Run `CREATE DATABASE springweb;` in MySQL Workbench or CLI.

## Viva Questions and Answers
1. **What is Thymeleaf?**
   - Thymeleaf is a modern server-side Java XML/XHTML/HTML5 template engine. It integrates tightly with Spring MVC to render dynamic web pages.
2. **What is the difference between `@Controller` and `@RestController`?**
   - `@Controller` is used to return traditional web view names (such as JSP or Thymeleaf HTML templates). `@RestController` returns raw data (JSON or XML) in the HTTP response body.
3. **What is the Post-Redirect-Get (PRG) pattern?**
   - PRG is a web development design pattern where a POST request redirects to a GET endpoint (`redirect:/`). This prevents double submission when a user refreshes the page.
4. **How does Thymeleaf loop through a list?**
   - Using the attribute `th:each="item : ${collection}"`.
5. **How does Spring Boot eliminate `web.xml` configuration?**
   - Spring Boot uses embedded servlet containers (Tomcat) and automated Servlet 3.0+ programmatic initialization via `@SpringBootApplication`.

## What I Must Remember
- Controller annotation for views: `@Controller`
- View data passing object: `org.springframework.ui.Model`
- Redirection syntax: `return "redirect:/";`
- Template loop syntax: `th:each="emp : ${employees}"`
- Dynamic text replacement: `th:text="${emp.name}"`
- Default server port in practical: `server.port=8083`
