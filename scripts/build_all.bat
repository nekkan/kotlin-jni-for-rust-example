@echo off

REM You will need to have Java Development Kit installed on your machine.
where java >NUL

if %ERRORLEVEL% neq 0 (
    echo "Command `java` not found. Make sure you have Java Development Kit installed in your machine."
    exit /b 1
)

REM You will need to have Cargo installed on your machine.
where cargo >NUL

if %ERRORLEVEL% neq 0 (
    echo "Command `cargo` not found. Make sure you have Cargo installed in your machine."
    exit /b 1
)

REM Set a variable that points to the Gradle project root directory.
SET root=%cd%

REM Set a variable that points to the resources folder.
SET resources="%cd%/src/main/resources"