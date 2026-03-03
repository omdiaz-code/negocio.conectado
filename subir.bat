@echo off
set /p msg="Mensaje del commit (o Enter para mensaje por defecto): "
if "%msg%"=="" set msg="Actualizacion automatica: %date% %time%"

echo.
echo Agregando cambios...
git add .

echo.
echo Realizando commit...
git commit -m "%msg%"

echo.
echo Subiendo a GitHub (rama main)...
git push origin main

echo.
echo ========================================
echo   ¡Cambios subidos correctamente!
echo ========================================
pause
