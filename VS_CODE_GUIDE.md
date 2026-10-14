# VS Code Guide for Enterprise Java Practicals

This guide explains how to open, build, run, debug, and connect MySQL for all 7 practicals using Visual Studio Code with the installed extensions:
1. Extension Pack for Java
2. Spring Boot Extension Pack
3. Community Server Connectors
4. MySQL Database Extension (Database Client / SQLTools)

---

## 1. Opening the Project in VS Code

You can open the workspace in either of these two ways:

### Option A: Open Folder
1. Launch VS Code.
2. Select **File -> Open Folder...**.
3. Choose the directory: `d:\Workspace\Uni\EPJ\Prac` (or `d:\Workspace\Uni\EPJ\Prac\Practicals`).
4. VS Code will detect the root `pom.xml` and automatically load all 7 practical modules into the **Java Projects** view.

### Option B: Open Workspace File (Multi-Root View)
1. Select **File -> Open Workspace from File...**.
2. Select `Enterprise_Java_Practicals.code-workspace`.
3. Each practical will appear as an organized, separate root project in the Explorer sidebar.

---

## 2. Connecting MySQL in VS Code

Your local MySQL service (`MySQL80`) is already running on port `3306`. You can manage it directly inside VS Code without needing external software.

### Method 1: Using "Database Client" Extension (Recommended GUI)
1. In VS Code, go to the **Extensions** view (`Ctrl + Shift + X`).
2. Search for and install: **Database Client** (by *cweijan*).
3. Click the database icon that appears in the VS Code Activity Bar on the left.
4. Click **Create Connection** -> select **MySQL**.
5. Fill in the connection settings:
   - **Host:** `localhost` (or `127.0.0.1`)
   - **Port:** `3306`
   - **Username:** `root`
   - **Password:** *(Your local MySQL root password)*
6. Click **Connect**.
7. Once connected, open `setup_all_databases.sql`, right-click in the editor, and click **Run SQL**. This creates and populates all tables for Practicals 01, 02, 04, 05, 06, and 07 in one click.

### Method 2: Using "SQLTools" Extension
1. In VS Code Extensions (`Ctrl + Shift + X`), install **SQLTools** and **SQLTools MySQL/MariaDB Driver**.
2. Connections for all practical databases (`mydb`, `demo_db`, `TestHibernate`, `springcrud`, `springweb`) are already pre-configured in `.vscode/settings.json`.
3. Click the SQLTools database icon in the Activity Bar, click on any practical database, and enter your password to connect.

---

## 3. Running Java Applications (Practicals 01, 02, 05, and Chat in Practical 03)
*Powered by **Extension Pack for Java***

1. Press `Ctrl + Shift + D` (or click the **Run and Debug** icon in the Activity Bar).
2. Open the dropdown at the top:
   - `Practical 01: Run JDBC App`
   - `Practical 02: Run PreparedStatement App`
   - `Practical 03: Run Chat Server (Port 5000)`
   - `Practical 03: Run Chat Client`
   - `Practical 05: Run Hibernate CRUD App`
3. Press **`F5`** (Debug) or **`Ctrl + F5`** (Run Without Debugging).
4. *Alternative:* Open any `App.java` file and click the small **`Run`** button directly above `public static void main(...)`.

---

## 4. Running Spring Boot Applications (Practicals 06 and 07)
*Powered by **Spring Boot Extension Pack***

1. Click the **Spring Boot Dashboard** icon (Spring leaf) in the Activity Bar.
2. You will see both apps listed:
   - `SpringCRUD` (Practical 06 - REST API on port 8082)
   - `SpringBootWebApp` (Practical 07 - Web App on port 8083)
3. Click the green **Play** button next to either project to launch it.
4. Open your browser:
   - Practical 06: `http://localhost:8082/` (Interactive REST Client Dashboard)
   - Practical 07: `http://localhost:8083/` (Thymeleaf Employee Records UI)

---

## 5. Running Servlets and JSP Applications (Practicals 03 and 04)
*Powered by **Community Server Connectors***

1. **Package the WAR files:**
   - Press `Ctrl + Shift + B` (or **Terminal -> Run Task...**).
   - Select `Package Practical 03 WAR (for Tomcat)` or `Package Practical 04 WAR (for Tomcat)`.
2. **Add Tomcat in VS Code:**
   - In the VS Code Explorer sidebar, find the **SERVERS** section.
   - Click `+` (**Create New Server**) -> select **Apache Tomcat** -> point to your local Tomcat directory.
3. **Deploy:**
   - Right-click your Tomcat server under **SERVERS** -> select **Add Deployment...**.
   - Browse to `Practicals/Practical_03/target/Practical_03.war` or `Practicals/Practical_04/target/Practical_04.war`.
   - Right-click server -> **Start Server**.
4. **Access in browser:**
   - Practical 03 Login: `http://localhost:8080/Practical_03/index.html`
   - Practical 03 Request Details: `http://localhost:8080/Practical_03/request-details`
   - Practical 04 Arithmetic: `http://localhost:8080/Practical_04/practical_4_1_arithmetic.jsp`
   - Practical 04 Login: `http://localhost:8080/Practical_04/index.html`

---

## 6. Pre-configured VS Code Tasks

Access via **Terminal -> Run Task...** (`Ctrl + Shift + P` -> `Tasks: Run Task`):

| Task Name | Description |
| :--- | :--- |
| `Build All Practicals (mvn clean compile)` | Compiles all 7 projects with Maven |
| `Package All WARs (mvn clean package)` | Packages WAR and JAR binaries for all practicals |
| `Package Practical 03 WAR (for Tomcat)` | Builds `Practical_03.war` |
| `Package Practical 04 WAR (for Tomcat)` | Builds `Practical_04.war` |
| `Run Spring Boot Practical 06` | Starts Practical 06 on port 8082 via Maven |
| `Run Spring Boot Practical 07` | Starts Practical 07 on port 8083 via Maven |
