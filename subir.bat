@echo off
cd /d "%~dp0"
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   NEGOCIO CONECTADO - GITHUB DEPLOY
echo ========================================

:: --- Detection ---
where git >nul 2>nul
if %errorlevel% neq 0 (
    if exist "C:\Program Files\Git\cmd\git.exe" (
        set "GIT_EXE=C:\Program Files\Git\cmd\git.exe"
    ) else if exist "C:\Program Files (x86)\Git\cmd\git.exe" (
        set "GIT_EXE=C:\Program Files (x86)\Git\cmd\git.exe"
    ) else (
        echo [!] ERROR: No se encontró 'git.exe'.
        echo Por favor usa Git CMD o instala Git.
        pause
        exit /b 1
    )
) else (
    set "GIT_EXE=git"
)

:: --- Script ---
set /p msg="📝 Mensaje del commit (Enter para default): "
if "!msg!"=="" set msg="Actualización: %date% %time%"

echo.
echo [+] Agregando archivos...
"%GIT_EXE%" add .

echo.
echo [+] Creando commit...
"%GIT_EXE%" commit -m "!msg!"

echo.
echo [+] Subiendo a GitHub...
"%GIT_EXE%" push origin main
if %errorlevel% neq 0 (
    echo [!] Reintentando con rama 'master'...
    "%GIT_EXE%" push origin master
)

echo.
if %errorlevel% equ 0 (
    echo ========================================
    echo   🚀 ¡EXITO! Cambios publicados.
    echo ========================================
) else (
    echo ========================================
    echo   ❌ ERROR en la subida.
    echo ========================================
)

pause
