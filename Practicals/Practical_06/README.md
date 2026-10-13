# Practical 06: Spring Boot REST CRUD Operations

## Practical Information
- Practical Number: 06
- Practical Title: Create Application to store the data in database to perform Spring CRUD operation
- Aim: To create a Spring Boot RESTful application that connects to MySQL using Spring Data JPA to perform complete CRUD operations (Create, Read, Update, Delete) on employee records.
- Technologies Used: Spring Boot 3.2.5, Spring Data JPA, Hibernate, Spring Web REST, MySQL Database, Maven

## Theory
### 1. Spring Boot Overview
Spring Boot provides auto-configuration, an embedded Tomcat server, and opinionated starter dependencies to build production-grade stand-alone Spring applications without complex XML configuration.

### 2. Spring Architecture Layers
- Entity Layer (`@Entity`): Java class mapped to the relational database table.
- Repository Layer (`JpaRepository`): Provides built-in CRUD query methods (`save()`, `findAll()`, `findById()`, `deleteById()`) without writing implementation code.
- Service Layer (`@Service`): Contains business logic and orchestrates repository calls.
- Controller Layer (`@RestController`): Exposes REST HTTP endpoints returning JSON responses (`@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`).

### 3. Key Annotations
- `@SpringBootApplication`: Combines `@Configuration`, `@EnableAutoConfiguration`, and `@ComponentScan`.
- `@RestController`: Marks the class as a web controller where methods return JSON serialized responses.
- `@RequestBody`: Deserializes incoming JSON request body to a Java object.
- `@PathVariable`: Extracts values from URI template paths (e.g. `/delete/{id}`).

## Files and Folder Structure
```
Practical_06/
├── pom.xml                                           - Maven configuration with Spring Boot Starters
├── schema.sql                                        - SQL script for database creation
├── README.md                                         - Documentation and running guide
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── springcrud/
        │           ├── SpringCrudApplication.java    - Spring Boot entry point
        │           ├── entity/
        │           │   └── Employee.java             - JPA Entity model
        │           ├── repository/
        │           │   └── EmployeeRepository.java   - Spring Data JPA interface
        │           ├── service/
        │           │   └── EmployeeService.java      - Service layer business logic
        │           └── controller/
        │               └── EmployeeController.java   - REST endpoints controller
        └── resources/
            ├── application.properties                - Database connection and server port 8082
            └── static/
                └── index.html                        - Interactive web testing dashboard
```

## Source Code
### 1. REST Controller Endpoints (`EmployeeController.java`):
- `GET /employee/` : Health check string.
- `POST /employee/save` : Accepts JSON, saves employee via `service.save(employee)`, returns saved entity.
- `GET /employee/all` : Returns JSON array of all employees.
- `PUT /employee/update/{id}` : Sets ID and updates employee record.
- `DELETE /employee/delete/{id}` : Deletes record by ID and returns confirmation message.

### 2. Repository (`EmployeeRepository.java`):
```java
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}
```
Inherits full CRUD capabilities without writing a single line of SQL.

## Database Setup
1. Start your local MySQL database server.
2. Run the database script from `schema.sql`:
```sql
CREATE DATABASE IF NOT EXISTS springcrud;
USE springcrud;
```
3. In `src/main/resources/application.properties`, configure credentials:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/springcrud
spring.datasource.username=root
spring.datasource.password=root
server.port=8082
```

## How to Run

### Method 1: Using Eclipse IDE
1. Open Eclipse IDE.
2. Go to **File -> Open Projects from File System...**.
3. Select `d:\Workspace\Uni\EPJ\Prac\Practicals\Practical_06` and click **Finish**.
4. Right-click the project -> **Maven -> Update Project...**.
5. Right-click `SpringCrudApplication.java` -> **Run As -> Java Application** (or **Run As -> Spring Boot App** if Spring Tools plugin is installed).
6. Console shows Tomcat starting on port `8082`.

### Method 2: Using Maven Command Line
1. Open terminal in the `Practical_06` folder.
2. Run:
   ```bash
   mvn spring-boot:run
   ```

### Method 3: Testing the API
- Option A (Browser GUI Dashboard): Open `http://localhost:8082/` to use the built-in test interface with Save, Update, Delete, and Fetch buttons.
- Option B (Postman / cURL):
  - **POST** `http://localhost:8082/employee/save`
    - Body (JSON): `{"name": "Vaibhavi", "city": "Gujarat"}`
  - **GET** `http://localhost:8082/employee/all`
  - **PUT** `http://localhost:8082/employee/update/1`
    - Body (JSON): `{"name": "Vaibhavi", "city": "Vadodara"}`
  - **DELETE** `http://localhost:8082/employee/delete/1`

## Expected Output

### 1. Terminal Startup:
```text
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.2.5)

Tomcat started on port 8082 (http) with context path ''
Started SpringCrudApplication in 2.748 seconds
```

### 2. POST `/employee/save`:
```json
{
  "id": 1,
  "name": "Vaibhavi",
  "city": "Gujarat"
}
```

### 3. GET `/employee/all`:
```json
[
  {
    "id": 1,
    "name": "Vaibhavi",
    "city": "Gujarat"
  }
]
```

### 4. PUT `/employee/update/1`:
```json
{
  "id": 1,
  "name": "Vaibhavi",
  "city": "Vadodara"
}
```

## Testing
- Application Startup Test: Checked that embedded Tomcat initializes on port 8082 without port collisions.
- Table Creation Test: Confirmed that Spring Data JPA creates table `employee (id, name, city)`.
- REST API Tests:
  - POST creates a new employee row and generates an ID.
  - GET lists all rows as JSON array.
  - PUT updates existing row attributes.
  - DELETE removes record from database table.

## Common Errors and Solutions
1. `Port 8082 was already in use`
   - Cause: Another application or instance of SpringCrudApplication is running.
   - Solution: Change `server.port=8084` in `application.properties` or stop the existing process.
2. `Access denied for user 'root'@'localhost'`
   - Cause: Incorrect password in `spring.datasource.password`.
   - Solution: Set your local MySQL password in `application.properties`.
3. `Unknown database 'springcrud'`
   - Cause: Database was not created before launching application.
   - Solution: Execute `CREATE DATABASE springcrud;` in MySQL.

## Viva Questions and Answers
1. **What is Spring Data JPA?**
   - It is a part of the Spring Data family that makes it easy to implement JPA-based repositories, removing boilerplate code by generating query implementations dynamically.
2. **What does `@RestController` do?**
   - It combines `@Controller` and `@ResponseBody`. It indicates that the data returned by each handler method is written directly into the HTTP response body as JSON.
3. **What is the purpose of `@Autowired`?**
   - It enables Spring's dependency injection to automatically wire bean collaborators into the target class.
4. **What is the difference between `@PathVariable` and `@RequestParam`?**
   - `@PathVariable` extracts values directly from the URL path (`/employee/{id}`), whereas `@RequestParam` extracts values from query parameters (`/employee?id=1`).
5. **How does `JpaRepository.save()` work for both Insert and Update?**
   - If the entity's ID is null or 0, it performs an SQL INSERT. If an existing ID is present, it performs an SQL UPDATE.

## What I Must Remember
- Main Spring Boot annotation: `@SpringBootApplication`
- Port configuration: `server.port=8082` in `application.properties`
- Auto schema setting: `spring.jpa.hibernate.ddl-auto=update`
- JpaRepository interface: `JpaRepository<Entity, IdType>`
- JSON request parameter: `@RequestBody Employee employee`
