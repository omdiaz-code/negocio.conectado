@echo off
setlocal
echo ========================================
echo   NEGOCIO CONECTADO - SUBIDA A GITHUB
echo ========================================

set /p msg="Ingresa mensaje de cambio (o Enter): "
if "%msg%"=="" set msg="Actualizacion: %date% %time%"

echo.
echo [+] Agregando cambios...
git add .

echo.
echo [+] Guardando cambios (commit)...
git commit -m "%msg%"

echo.
echo [+] Enviando a GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo [!] ERROR: No se pudo subir a 'main'. Intentando con 'master'...
    git push origin master
)

echo.
if %errorlevel% equ 0 (
    echo ========================================
    echo   ¡EXITO! Cambios en la nube.
    echo ========================================
) else (
    echo ========================================
    echo   [!] ALGO SALIO MAL. Revisa tu internet o Git.
    echo ========================================
)
pause
