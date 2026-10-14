$ErrorActionPreference = "Stop"

if (-not (Test-Path "$env:JAVA_HOME\bin\java.exe")) {
    if (Test-Path "C:\Program Files\Java\jdk-26.0.2.1\bin\java.exe") {
        $env:JAVA_HOME = "C:\Program Files\Java\jdk-26.0.2.1"
    } elseif (Test-Path "C:\Program Files\Java\latest\bin\java.exe") {
        $env:JAVA_HOME = "C:\Program Files\Java\latest"
    }
}

$mvnCmd = $null
if (Get-Command "mvn" -ErrorAction SilentlyContinue) {
    $mvnCmd = "mvn"
} else {
    $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $cand1 = Join-Path $scriptDir "..\..\tools\maven\bin\mvn.cmd"
    $cand2 = Join-Path $scriptDir "..\tools\maven\bin\mvn.cmd"
    $cand3 = "D:\Workspace\Uni\EPJ\Prac\tools\maven\bin\mvn.cmd"
    if (Test-Path $cand1) {
        $mvnCmd = (Resolve-Path $cand1).Path
    } elseif (Test-Path $cand2) {
        $mvnCmd = (Resolve-Path $cand2).Path
    } elseif (Test-Path $cand3) {
        $mvnCmd = (Resolve-Path $cand3).Path
    }
}

if (-not $mvnCmd) {
    Write-Host "[INFO] Downloading portable Maven..."
    $toolsDir = Join-Path $PSScriptRoot "..\..\tools"
    if (-not (Test-Path $toolsDir)) {
        New-Item -ItemType Directory -Path $toolsDir -Force | Out-Null
    }
    $zipPath = Join-Path $toolsDir "maven.zip"
    curl.exe -L "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip" -o $zipPath
    tar.exe -xf $zipPath -C $toolsDir
    Move-Item (Join-Path $toolsDir "apache-maven-3.9.6") (Join-Path $toolsDir "maven") -Force
    Remove-Item $zipPath -Force
    $mvnCmd = Join-Path $toolsDir "maven\bin\mvn.cmd"
}

& $mvnCmd spring-boot:run
