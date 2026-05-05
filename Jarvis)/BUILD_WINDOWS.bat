@echo off
echo ========================================
echo  JARVIS APK Builder
echo ========================================
echo.
echo Step 1: Checking Java...
java -version 2>nul || (echo ERROR: Java not found. Install JDK 17 from adoptium.net & pause & exit)

echo Step 2: Building debug APK...
call gradlew.bat assembleDebug

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo  SUCCESS! APK is at:
    echo  app\build\outputs\apk\debug\app-debug.apk
    echo ========================================
    echo.
    echo Transfer app-debug.apk to your phone and install it.
) else (
    echo.
    echo BUILD FAILED. Check errors above.
)
pause
