@echo off
setlocal enabledelayedexpansion

:: =============================================
:: CONFIGURATION - Edit these values as needed
:: =============================================
set UE_VERSION=5.7
set UE_INSTALL_PATH=C:\EpicGames
set REBUILD_AFTER=false
set OPEN_SOLUTION_AFTER=true
:: =============================================

:: Ensure script runs from its own directory
pushd %~dp0

echo.
echo =============================================
echo Unreal Project Clean + Regenerate Script
echo =============================================
echo.

:: ---------------------------------------------
:: Locate .uproject file automatically
:: ---------------------------------------------
set PROJECT_FILE=
for %%i in (*.uproject) do (
    set PROJECT_FILE=%%i
    set PROJECT_NAME=%%~ni
)

if "%PROJECT_FILE%"=="" (
    echo ERROR: No .uproject file found in this directory.
    pause
    exit /b 1
)

set PROJECT_FILE=%CD%\%PROJECT_FILE%
set SOLUTION_FILE=%CD%\%PROJECT_NAME%.sln

:: ---------------------------------------------
:: Build UnrealBuildTool path
:: ---------------------------------------------
set UBT=%UE_INSTALL_PATH%\UE_%UE_VERSION%\Engine\Binaries\DotNET\UnrealBuildTool\UnrealBuildTool.exe

if not exist "%UBT%" (
    echo ERROR: UnrealBuildTool not found at:
    echo %UBT%
    echo.
    echo Check UE_VERSION or UE_INSTALL_PATH.
    pause
    exit /b 1
)

:: ---------------------------------------------
:: Clean project folders safely
:: ---------------------------------------------
echo Cleaning project folders...

if exist Binaries rmdir /s /q Binaries
if exist Intermediate rmdir /s /q Intermediate
if exist Saved rmdir /s /q Saved

echo Clean complete.
echo.

:: ---------------------------------------------
:: Generate project files
:: ---------------------------------------------
echo Generating project files...
call "%UBT%" -projectfiles -project="%PROJECT_FILE%" -game -rocket -progress

if errorlevel 1 (
    echo ERROR: Failed to generate project files.
    pause
    exit /b 1
)

echo Project files generated.
echo.

:: ---------------------------------------------
:: Optional: Rebuild Editor
:: ---------------------------------------------
if "%REBUILD_AFTER%"=="true" (
    echo Rebuilding Unreal Editor target...
    call "%UBT%" %PROJECT_NAME%Editor Win64 Development -project="%PROJECT_FILE%" -waitmutex
    echo Rebuild complete.
    echo.
)

:: ---------------------------------------------
:: Optional: Open Solution
:: ---------------------------------------------
if "%OPEN_SOLUTION_AFTER%"=="true" (
    if exist "%SOLUTION_FILE%" (
        echo Opening solution...
        start "" "%SOLUTION_FILE%"
    ) else (
        echo WARNING: Solution file not found.
    )
)

echo =============================================
echo Done!
echo =============================================
echo.

popd
endlocal
