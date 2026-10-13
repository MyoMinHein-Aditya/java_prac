# Practical 03: Servlet Programming and Socket Chat

## Practical Information
- Practical Number: 03
- Practical Title: Servlet Programming (Request Details, Authentication, Session Tracking, Cookies, and Socket Chat Server)
- Aim: To develop a Servlet program that displays HTTP request details such as request method, client IP address, server name, and browser information; handle HTML form authentication, create and track sessions and cookies; and implement a socket chat server using ServerSocket and Socket.
- Technologies Used: Java (JDK 17 or higher), Java Servlets API (`javax.servlet`), Apache Tomcat Server, HTML5, CSS3, Java Socket Networking (`java.net`), Maven

## Theory
### 1. Java Servlet Life Cycle
A Servlet is a Java class that responds to incoming HTTP network requests.
The servlet lifecycle consists of three primary methods:
- `init(ServletConfig config)`: Called once when the servlet is loaded into server memory.
- `service(ServletRequest req, ServletResponse res)`: Dispatches to `doGet()` or `doPost()` for each request.
- `destroy()`: Called once when the server shuts down or unloads the servlet.

### 2. HTTP Request Information
The `HttpServletRequest` interface provides metadata regarding the HTTP request:
- `getMethod()`: Returns HTTP method (GET, POST).
- `getRemoteAddr()`: Returns IP address of the client machine.
- `getServerName()`: Host name of the web server.
- `getServerPort()`: Port number of the server.
- `getHeader("User-Agent")`: Browser details and client operating system.

### 3. Session Tracking and Cookies
- `HttpSession`: Manages state on the server side between client requests using a unique Session ID.
- `Cookie`: Small text key-value pair stored on the client browser. Sent back to the server in HTTP request headers.

### 4. Socket Programming
- `ServerSocket`: Waits for incoming requests over the network on a specific port (`accept()`).
- `Socket`: Establishes the communication endpoint between client and server for streaming data (`InputStream`, `OutputStream`).

## Files and Folder Structure
```
Practical_03/
├── pom.xml                                  - Maven WAR configuration with javax.servlet-api
├── README.md                                - Complete documentation and guide
└── src/
    └── main/
        ├── java/
        │   ├── com/
        │   │   ├── simple/
        │   │   │   ├── MainServlet.java            - Form processing, user authentication, session count, and cookie saving
        │   │   │   ├── RequestDetailsServlet.java  - Displays method, IP, server name, browser, and headers
        │   │   │   ├── HelloWorldServlet.java      - Hello World servlet
        │   │   │   ├── CookieDemoServlet.java      - Cookie creation and retrieval
        │   │   │   └── SessionTrackingServlet.java - Session creation and visit counter
        │   │   └── chat/
        │   │       ├── ChatServer.java             - ServerSocket chat server
        │   │       └── ChatClient.java             - Socket chat client
        └── webapp/
            ├── index.html                   - Styled login form with links
            ├── Register.html                - Student registration page
            └── WEB-INF/
                └── web.xml                  - Deployment descriptor
```

## Source Code
### 1. `MainServlet.java` (`@WebServlet("/MainApp")`)
- Reads form inputs: `request.getParameter("user")` and `request.getParameter("pass")`.
- Checks credentials: `"admin".equals(user) && "1234".equals(pass)`.
- Increments session visit counter: `session.setAttribute("count", count)`.
- Adds persistent cookie: `response.addCookie(new Cookie("lastUser", user))`.
- Renders HTML dashboard with user details.

### 2. `RequestDetailsServlet.java` (`@WebServlet("/request-details")`)
- Extracts IP using `request.getRemoteAddr()`.
- Extracts method using `request.getMethod()`.
- Extracts server name and port using `request.getServerName()` and `request.getServerPort()`.
- Extracts browser string via `request.getHeader("User-Agent")`.

### 3. `ChatServer.java` & `ChatClient.java`
- `ChatServer`: Listens on port `5000` with `ServerSocket.accept()`. Spawns read thread and console write loop.
- `ChatClient`: Connects to `localhost:5000` via `new Socket("localhost", 5000)`. Sends and receives chat messages in real time.

## Database Setup
This practical is focused on Servlets, Session Tracking, Cookies, and Network Sockets. It does not require a database connection. Form authentication uses the verified hardcoded credentials specified in the manual:
- Username: `admin`
- Password: `1234`

## How to Run

### Method 1: Running Servlets in Eclipse with Apache Tomcat
1. Install Apache Tomcat 9 or 10 in Eclipse (**Window -> Preferences -> Server -> Runtime Environments -> Add... -> Apache Tomcat**).
2. Import `Practical_03` into Eclipse via **File -> Open Projects from File System...**.
3. Right-click project -> **Run As -> Run on Server**.
4. Select Tomcat server and click **Finish**.
5. Open browser at: `http://localhost:8080/Practical_03/index.html`.
6. Enter `admin` and `1234` and click **Login**.

### Method 2: Running Socket Chat Program in Eclipse
1. Right-click `com.chat.ChatServer.java` -> **Run As -> Java Application**.
2. Notice the console outputs: `Server listening on port 5000...`.
3. Right-click `com.chat.ChatClient.java` -> **Run As -> Java Application**.
4. Type messages in the client console and server console to observe real-time two-way communication.
5. Type `bye` to terminate the session.

## Expected Output

### 1. MainServlet Login Successful:
```text
Login Successful
------------------------------------------------
Username    : admin
Session ID  : 2B75E60051B59E43A8635AA4273934FA4
Visit Count : 2
Cookie      : lastUser Saved
------------------------------------------------
[Back to Login]
```

### 2. Request Details Servlet:
```text
HTTP Request Details
HTTP Request Method                : GET
Client IP Address                  : 127.0.0.1
Server Name                        : localhost
Server Port                        : 8080
Browser Information (User-Agent)   : Mozilla/5.0 (Windows NT 10.0; Win64; x64) ...
```

### 3. Socket Chat Server & Client:
```text
[ChatServer Console]
Server listening on port 5000. Waiting for client to connect...
Client connected from: /127.0.0.1:54321
[Client]: Hello Server from Myo Min Hein!
Server response: Hello Client, message received!

[ChatClient Console]
Connected to Chat Server successfully!
Type your messages and press Enter. Type 'bye' to exit.
Hello Server from Myo Min Hein!
[Server]: Hello Client, message received!
```

## Testing
- Authentication Test: Tested valid login (`admin`/`1234`) which displays dashboard. Tested invalid credentials which displays "Login Failed".
- Session Counter Test: Refreshing the dashboard increments `Visit Count` by 1.
- Cookie Test: Inspected browser cookies and verified `lastUser` is present with max age 3600 seconds.
- Request Details Test: Navigated to `/request-details` and confirmed client IP, browser string, and server port render properly.
- Socket Connection Test: Verified that client establishes a TCP connection to port 5000 and messages echo both ways without data corruption.

## Common Errors and Solutions
1. `404 Not Found` when opening `http://localhost:8080/Practical_03/MainApp`
   - Cause: URL pattern mismatch or application not deployed properly to Tomcat context root.
   - Solution: Verify `@WebServlet("/MainApp")` is present and project is added to Tomcat's deployment list.
2. `java.net.BindException: Address already in use: JVM_Bind`
   - Cause: Port 5000 is already used by another running ChatServer process or application.
   - Solution: Stop previous Java processes or change port number to 5001.
3. `java.net.ConnectException: Connection refused: connect`
   - Cause: Running `ChatClient` before starting `ChatServer`.
   - Solution: Always run `ChatServer.java` first, then run `ChatClient.java`.

## Viva Questions and Answers
1. **What is the life cycle of a Servlet?**
   - Three stages: `init()` (initialization), `service()` (request processing), and `destroy()` (cleanup).
2. **What is the difference between `doGet()` and `doPost()`?**
   - `doGet()` appends form data in URL parameters (visible in query string, limited length). `doPost()` sends data inside HTTP request body (secure for passwords, unlimited size).
3. **What is the difference between Session and Cookie?**
   - Session stores data on the server side; Cookie stores data on the client browser.
4. **How do you get client IP in a Servlet?**
   - `request.getRemoteAddr()`.
5. **Which classes are used for TCP socket communication in Java?**
   - `java.net.ServerSocket` (on server) and `java.net.Socket` (on client).

## What I Must Remember
- Annotation to map a servlet: `@WebServlet("/urlPattern")`
- Method to get request parameter: `request.getParameter("paramName")`
- Method to get session: `request.getSession()`
- Method to add cookie: `response.addCookie(cookieObj)`
- Socket listening method: `serverSocket.accept()`
