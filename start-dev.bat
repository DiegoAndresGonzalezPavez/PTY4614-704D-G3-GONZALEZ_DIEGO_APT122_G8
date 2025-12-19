@echo off
REM Script para iniciar todos los servidores de VetCare Pro en Windows

echo.
echo ========================================
echo   VETCARE PRO - INICIANDO SERVIDORES
echo ========================================
echo.

REM Cambiar a directorio del proyecto
cd /d "%~dp0"

echo [1/3] Iniciando Backend (Puerto 5000)...
start "VetCare Backend" cmd /k "cd server && npm start"
timeout /t 3 /nobreak

echo [2/3] Iniciando Frontend (Puerto 3000)...
start "VetCare Client" cmd /k "cd client && npm run dev"
timeout /t 3 /nobreak

echo [3/3] Iniciando Landing Page (Puerto 4321)...
start "VetCare Landing" cmd /k "cd landing && npm run dev"
timeout /t 2 /nobreak

echo.
echo ========================================
echo   SERVIDORES INICIADOS
echo ========================================
echo.
echo URLS:
echo   Backend:  http://localhost:5000
echo   Frontend: http://localhost:3000
echo   Landing:  http://localhost:4321
echo.
echo Para detener los servidores, cierra las ventanas de terminal
echo.
pause
