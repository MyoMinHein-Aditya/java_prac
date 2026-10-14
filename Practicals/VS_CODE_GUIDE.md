# VS Code Guide for Enterprise Java Practicals

This guide explains how to open, build, run, and debug all 7 practicals using Visual Studio Code with the installed extensions:
1. Extension Pack for Java
2. Spring Boot Extension Pack
3. Community Server Connectors

---

## 1. Opening the Project in VS Code

You can open the workspace in either of these two ways:

### Option A: Open Folder
1. Launch VS Code.
2. Select **File -> Open Folder...**.
3. Choose the directory: `d:\Workspace\Uni\EPJ\Prac` or `d:\Workspace\Uni\EPJ\Prac\Practicals`.
4. VS Code will detect the root `pom.xml` and automatically load all 7 practical modules into the **Java Projects** view.

### Option B: Open Workspace File (Multi-Root View)
1. Select **File -> Open Workspace from File...**.
2. Select `Enterprise_Java_Practicals.code-workspace`.
3. Each practical will appear as an organized, separate root project in the Explorer sidebar.

---

## 2. Using Extension Pack for Java

The Extension Pack for Java provides full language support, auto-completion, Maven integration, and debugging.

### Running Java Applications (Practicals 01, 02, 05, and Chat in Practical 03)
There are two easy ways to run any practical:

#### Method 1: Using the Run & Debug Dropdown (Recommended)
1. Press `Ctrl + Shift + D` or click the **Run and Debug** icon in the Activity Bar.
2. Open the configuration dropdown at the top:
   - `Practical 01: Run JDBC App`
   - `Practical 02: Run PreparedStatement App`
   - `Practical 03: Run Chat Server (Port 5000)`
   - `Practical 03: Run Chat Client`
   - `Practical 05: Run Hibernate CRUD App`
   - `Practical 06: Run Spring Boot REST App (Port 8082)`
   - `Practical 07: Run Spring Boot Web App (Port 8083)`
3. Select the desired practical and press `F5` (Debug) or `Ctrl + F5` (Run Without Debugging).

#### Method 2: Using In-Editor CodeLens
1. Open any Java file with a `main` method (e.g. `App.java`).
2. Click the **Run** or **Debug** text button that appears directly above `public static void main(String[] args)`.

---

## 3. Using Spring Boot Extension Pack (Practicals 06 and 07)

The Spring Boot Extension Pack provides dedicated tools for Spring applications.

### Using the Spring Boot Dashboard:
1. Look for the Spring leaf icon in the VS Code Activity Bar (or the **Spring Boot Dashboard** in the Explorer view).
2. You will see both Spring Boot applications listed:
   - `SpringCRUD` (Practical 06)
   - `SpringBootWebApp` (Practical 07)
3. Hover over either project and click the **Play** button to start, or click the **Stop** button to shut it down.
4. Access endpoints in your browser:
   - Practical 06: `http://localhost:8082/` (Built-in REST test dashboard)
   - Practical 07: `http://localhost:8083/` (Thymeleaf employee records page)

---

## 4. Using Community Server Connectors (Practicals 03 and 04)

Community Server Connectors manages application servers like Apache Tomcat directly inside VS Code.

### Step 1: Add Apache Tomcat to VS Code
1. In the VS Code Explorer sidebar, find the **SERVERS** section.
2. Click the `+` icon or right-click in the section and select **Create New Server**.
3. Choose **Apache Tomcat** from the list.
4. Browse and select your local Apache Tomcat installation folder (e.g., Tomcat 9 or Tomcat 10).
5. Click **Finish**. Tomcat will now appear under the **SERVERS** tree.

### Step 2: Build the WAR Files
1. Press `Ctrl + Shift + B` (or go to **Terminal -> Run Task...**).
2. Select:
   - `Package Practical 03 WAR (for Tomcat)` to build `Practical_03.war`.
   - `Package Practical 04 WAR (for Tomcat)` to build `Practical_04.war`.
3. The packaged `.war` files are generated in `Practical_03/target/` and `Practical_04/target/`.

### Step 3: Deploy to Tomcat in VS Code
1. In the **SERVERS** view, right-click your configured **Apache Tomcat** server.
2. Select **Add Deployment...**.
3. Choose **File** and browse to:
   - `Practical_03/target/Practical_03.war` (for Practical 03)
   - `Practical_04/target/Practical_04.war` (for Practical 04)
4. Right-click the server and choose **Start Server**.
5. Once started, open your web browser:
   - Practical 03 Login: `http://localhost:8080/Practical_03/index.html`
   - Practical 03 Details: `http://localhost:8080/Practical_03/request-details`
   - Practical 04 Arithmetic: `http://localhost:8080/Practical_04/practical_4_1_arithmetic.jsp`
   - Practical 04 Login: `http://localhost:8080/Practical_04/index.html`

---

## 5. Summary of Pre-configured VS Code Tasks

Access these via **Terminal -> Run Task...** or `Ctrl + Shift + P` -> `Tasks: Run Task`:

| Task Name | Description |
| :--- | :--- |
| `Build All Practicals (mvn clean compile)` | Compiles all 7 projects using Maven |
| `Package All WARs (mvn clean package)` | Generates WAR and JAR packages for all projects |
| `Package Practical 03 WAR (for Tomcat)` | Builds `Practical_03.war` |
| `Package Practical 04 WAR (for Tomcat)` | Builds `Practical_04.war` |
| `Run Spring Boot Practical 06` | Starts Practical 06 on port 8082 via Maven |
| `Run Spring Boot Practical 07` | Starts Practical 07 on port 8083 via Maven |
