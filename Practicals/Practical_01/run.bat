@echo off
setlocal

if not exist "%JAVA_HOME%\bin\java.exe" (
    if exist "C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe" (
        set "JAVA_HOME=C:\Program Files\Java\jdk-26.0.2.1"
    ) else if exist "C:\Program Files\Java\latest\bin\java.exe" (
        set "JAVA_HOME=C:\Program Files\Java\latest"
    )
)

set "MVN_CMD="
where mvn >nul 2>nul
if %ERRORLEVEL% equ 0 (
    set "MVN_CMD=mvn"
) else if exist "%~dp0..\..\tools\maven\bin\mvn.cmd" (
    set "MVN_CMD=%~dp0..\..\tools\maven\bin\mvn.cmd"
) else if exist "%~dp0..\tools\maven\bin\mvn.cmd" (
    set "MVN_CMD=%~dp0..\tools\maven\bin\mvn.cmd"
) else if exist "D:\Workspace\Uni\EPJ\Prac\tools\maven\bin\mvn.cmd" (
    set "MVN_CMD=D:\Workspace\Uni\EPJ\Prac\tools\maven\bin\mvn.cmd"
)

if "%MVN_CMD%"=="" (
    echo [INFO] Maven not found. Downloading portable Maven...
    if not exist "%~dp0..\..\tools" mkdir "%~dp0..\..\tools"
    curl.exe -L "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip" -o "%~dp0..\..\tools\maven.zip"
    tar.exe -xf "%~dp0..\..\tools\maven.zip" -C "%~dp0..\..\tools"
    move "%~dp0..\..\tools\apache-maven-3.9.6" "%~dp0..\..\tools\maven" >nul 2>nul
    del "%~dp0..\..\tools\maven.zip" >nul 2>nul
    set "MVN_CMD=%~dp0..\..\tools\maven\bin\mvn.cmd"
)

"%MVN_CMD%" clean compile exec:java
