# Practicals 03, 04, and 05 - Execution & Build Fix Guide

- **Student Name:** Kalpataru Dash
- **Subject:** Enterprise Programming Using Java (303105310)
- **MySQL User:** `root` | **Password:** `Dash@1908` | **Port:** `3306`

---

## Why the Build Failures Occurred and What Was Fixed

| Practical | Issue Encountered | Fix Applied |
| :--- | :--- | :--- |
| **Practical 03** | Port `8085` was in use / `mainClass` missing for exec | Background task stopped, port freed; pre-configured default `mainClass` in `pom.xml`. |
| **Practical 04** | `No plugin found for prefix 'jetty'` when running from terminal | Added `jetty-maven-plugin` configured on port `8086` to run all JSPs without Eclipse. |
| **Practical 05** | `The parameters 'mainClass' are missing or invalid` | Configured `exec-maven-plugin` with `n.a.w.App` and added clean JVM shutdown. |

---

## 1. Practical 03: Socket Chat & Servlets

### Part A: Start Socket Chat Server (Port 5000)
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_03"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" test-compile exec:java
```

### Part B: Start Socket Chat Client (New Terminal)
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_03"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" test-compile "exec:java" "-Dexec.mainClass=com.chat.ChatClient"
```

### Part C: Servlets (Web Browser via Port 8085)
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_03"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" jetty:run
```

**Browser URLs to Test:**
- **Login Page:** http://localhost:8085/Practical_03/index.html (Default Login: `admin` / `1234`)
- **Register Form:** http://localhost:8085/Practical_03/Register.html
- **Hello Servlet:** http://localhost:8085/Practical_03/hello
- **Session Tracking:** http://localhost:8085/Practical_03/session
- **Cookies Demo:** http://localhost:8085/Practical_03/cookies
- **Request Details:** http://localhost:8085/Practical_03/request-details

*(Press `Ctrl + C` in PowerShell to stop the server).*

---

## 2. Practical 04: JSP Web Application & JDBC Integration

### Run from Terminal (Port 8086 via Jetty):
```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_04"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" jetty:run
```

**Browser URLs to Test:**
- **Login Page:** http://localhost:8086/Practical_04/index.html (Test Login: `admin` / `1234`)
- **Add User Form (JDBC):** http://localhost:8086/Practical_04/insert_user.jsp
- **Arithmetic Scriptlet Demo:** http://localhost:8086/Practical_04/practical_4_1_arithmetic.jsp
- **JSP Implicit Objects:** http://localhost:8086/Practical_04/implicit_objects.jsp

*(Press `Ctrl + C` in PowerShell to stop the server).*

---

## 3. Practical 05: Hibernate ORM CRUD Operations

```powershell
cd "D:\Coading World\javaptr\java_prac\Practicals\Practical_05"
& "D:\Coading World\Nexux\backend\apache-maven-3.9.6\bin\mvn.cmd" compile exec:java
```

**Expected Output:**
1. Connects to MySQL schema `TestHibernate`.
2. Inserts employee: `Kalpataru Dash` (`Bhubaneswar`).
3. Queries and prints all employee records via HQL.
4. Exits cleanly with `BUILD SUCCESS`.
