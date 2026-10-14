param(
    [string]$Id = ""
)

if (-not (Test-Path "$env:JAVA_HOME\bin\java.exe")) {
    if (Test-Path "C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe") {
        $env:JAVA_HOME = "C:\Program Files\Java\jdk-26.0.2.1"
    } elseif (Test-Path "C:\Program Files\Java\latest\bin\java.exe") {
        $env:JAVA_HOME = "C:\Program Files\Java\latest"
    }
}

if ($Id -eq "") {
    Write-Host "========================================================"
    Write-Host "Enterprise Java Practicals - Quick Runner"
    Write-Host "========================================================"
    Write-Host "[1] Practical 01: JDBC Record Insert and Retrieve"
    Write-Host "[2] Practical 02: PreparedStatement and ResultSet"
    Write-Host "[3] Practical 03: Servlets Web App (Port 8080)"
    Write-Host "[4] Practical 04: JSP Web App (Port 8080)"
    Write-Host "[5] Practical 05: Hibernate CRUD Operations"
    Write-Host "[6] Practical 06: Spring Boot REST CRUD (Port 8082)"
    Write-Host "[7] Practical 07: Spring Boot Web App (Port 8083)"
    Write-Host "========================================================"
    $Id = Read-Host "Enter practical number [1-7]"
}

switch ($Id) {
    { $_ -in "1", "01" } { Push-Location Practical_01; .\run.ps1; Pop-Location }
    { $_ -in "2", "02" } { Push-Location Practical_02; .\run.ps1; Pop-Location }
    { $_ -in "3", "03" } { Push-Location Practical_03; .\run.ps1; Pop-Location }
    { $_ -in "4", "04" } { Push-Location Practical_04; .\run.ps1; Pop-Location }
    { $_ -in "5", "05" } { Push-Location Practical_05; .\run.ps1; Pop-Location }
    { $_ -in "6", "06" } { Push-Location Practical_06; .\run.ps1; Pop-Location }
    { $_ -in "7", "07" } { Push-Location Practical_07; .\run.ps1; Pop-Location }
    default { Write-Host "Invalid option. Enter a number between 1 and 7." }
}
