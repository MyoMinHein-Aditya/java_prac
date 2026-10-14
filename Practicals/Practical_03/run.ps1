param(
    [string]$Mode = "web"
)

if ($Mode -eq "chat-server") {
    Write-Host "Starting Chat Server on port 5000..."
    mvn compile exec:java -Dexec.mainClass="com.chat.ChatServer"
} elseif ($Mode -eq "chat-client") {
    Write-Host "Starting Chat Client..."
    mvn compile exec:java -Dexec.mainClass="com.chat.ChatClient"
} else {
    Write-Host "Starting Practical 03 Web Application on port 8080..."
    mvn clean compile exec:java -Dexec.mainClass="com.simple.ServerRunner"
}
