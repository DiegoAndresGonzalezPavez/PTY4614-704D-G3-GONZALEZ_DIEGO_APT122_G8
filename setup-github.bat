@echo off
REM Script para preparar el proyecto para GitHub y Vercel (Windows)
REM Uso: setup-github.bat

echo =========================================
echo   Setup: GitHub + Vercel
echo =========================================
echo.

REM Verificar si git está iniciado
if not exist .git (
    echo 1. Inicializando repositorio Git...
    git init
    echo OK - Git inicializado
) else (
    echo OK - Repositorio Git ya existe
)

echo.
echo 2. Configurando usuario Git...
set /p GIT_NAME="Ingresa tu nombre (Enter para 'VetCare Developer'): "
if "%GIT_NAME%"=="" set GIT_NAME=VetCare Developer

set /p GIT_EMAIL="Ingresa tu email: "
if "%GIT_EMAIL%"=="" set GIT_EMAIL=dev@vetcare.pro

git config user.name "%GIT_NAME%"
git config user.email "%GIT_EMAIL%"
echo OK - Usuario configurado: %GIT_NAME% ^<%GIT_EMAIL%^>

echo.
echo 3. Preparando archivos...
echo   - .gitignore
echo   - vercel.json
echo   - DEPLOYMENT_VERCEL.md
echo OK - Archivos preparados

echo.
echo 4. Agregando archivos a Git...
git add .
echo OK - Archivos agregados

echo.
echo 5. Realizando primer commit...
git commit -m "Initial commit: VetCare Pro E-Commerce con Next.js, Express y Astro"
echo OK - Commit realizado

echo.
echo =========================================
echo   SIGUIENTES PASOS:
echo =========================================
echo.
echo 1. Crear repositorio en GitHub:
echo    https://github.com/new
echo.
echo 2. Ejecutar estos comandos:
echo.
echo    git remote add origin https://github.com/TU_USUARIO/vetcare-pro.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Desplegar en Vercel:
echo    https://vercel.com/dashboard
echo.
echo =========================================
pause
