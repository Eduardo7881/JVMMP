@echo off
@REM ONLY CHANGE THIS CODE IF YOU KNOW WHAT IS DOING
echo Verifying file existence...

@REM ---- memory allocation ----
set "JVMOpts=-Xmx1024M -Xms512M"

@REM ---- File location: default version 1.0 nbsjava1
set file=nbsjava1.jar

if exist %file% (
    echo File exists. Checking file size...
    java --version > nul
    if %errorlevel% == 0 (
           echo Java installed!
           goto executeprog
    ) else (
         echo Java not installed.
         echo Java is the REQUIRED program to run this.
         echo Install at least Java 8.
         echo Press any key to exit.
         pause >nul
         exit
    )
) else (
    echo The file %file% does not exist.
    exit /b
)

:executeprog
echo Allocated Java Memory: 1 Gigabyte
echo If you want to change it, change in this file.
echo The Program is ready to start! Press any key to start
pause >nul
cls
java %JVMOpts% -jar %file%
echo.
echo.
echo Program execution completed!
echo Press any key to exit
pause >nul
exit /b
