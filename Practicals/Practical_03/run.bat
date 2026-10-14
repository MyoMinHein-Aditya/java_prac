@echo off
if "%1"=="" goto web
if "%1"=="web" goto web
if "%1"=="chat-server" goto chat_server
if "%1"=="chat-client" goto chat_client

:web
echo Starting Practical 03 Web Application on port 8080...
mvn clean compile exec:java -Dexec.mainClass="com.simple.ServerRunner"
goto end

:chat_server
echo Starting Chat Server on port 5000...
mvn compile exec:java -Dexec.mainClass="com.chat.ChatServer"
goto end

:chat_client
echo Starting Chat Client...
mvn compile exec:java -Dexec.mainClass="com.chat.ChatClient"
goto end

:end
