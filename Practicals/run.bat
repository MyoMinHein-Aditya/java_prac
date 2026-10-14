@echo off
if not exist "%JAVA_HOME%\bin\java.exe" (
    if exist "C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe" (
        set "JAVA_HOME=C:\Program Files\Java\jdk-26.0.2.1"
    ) else if exist "C:\Program Files\Java\latest\bin\java.exe" (
        set "JAVA_HOME=C:\Program Files\Java\latest"
    )
)
if "%1"=="1" goto p1
if "%1"=="01" goto p1
if "%1"=="2" goto p2
if "%1"=="02" goto p2
if "%1"=="3" goto p3
if "%1"=="03" goto p3
if "%1"=="4" goto p4
if "%1"=="04" goto p4
if "%1"=="5" goto p5
if "%1"=="05" goto p5
if "%1"=="6" goto p6
if "%1"=="06" goto p6
if "%1"=="7" goto p7
if "%1"=="07" goto p7

:menu
echo ========================================================
echo Enterprise Java Practicals - Quick Runner
echo ========================================================
echo [1] Practical 01: JDBC Record Insert and Retrieve
echo [2] Practical 02: PreparedStatement and ResultSet
echo [3] Practical 03: Servlets Web App (Port 8080)
echo [4] Practical 04: JSP Web App (Port 8080)
echo [5] Practical 05: Hibernate CRUD Operations
echo [6] Practical 06: Spring Boot REST CRUD (Port 8082)
echo [7] Practical 07: Spring Boot Web App (Port 8083)
echo ========================================================
set /p choice="Enter practical number [1-7]: "

if "%choice%"=="1" goto p1
if "%choice%"=="2" goto p2
if "%choice%"=="3" goto p3
if "%choice%"=="4" goto p4
if "%choice%"=="5" goto p5
if "%choice%"=="6" goto p6
if "%choice%"=="7" goto p7
echo Invalid choice.
exit /b

:p1
cd Practical_01 && call run.bat
goto end

:p2
cd Practical_02 && call run.bat
goto end

:p3
cd Practical_03 && call run.bat
goto end

:p4
cd Practical_04 && call run.bat
goto end

:p5
cd Practical_05 && call run.bat
goto end

:p6
cd Practical_06 && call run.bat
goto end

:p7
cd Practical_07 && call run.bat
goto end

:end
