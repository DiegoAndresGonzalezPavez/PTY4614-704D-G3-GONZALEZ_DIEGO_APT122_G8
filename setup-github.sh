#!/bin/bash

# Script para preparar el proyecto para GitHub y Vercel
# Uso: ./setup-github.sh

echo "========================================="
echo "  Setup: GitHub + Vercel"
echo "========================================="
echo ""

# Verificar si git está iniciado
if [ ! -d .git ]; then
    echo "1️⃣  Inicializando repositorio Git..."
    git init
    echo "✅ Git inicializado"
else
    echo "✅ Repositorio Git ya existe"
fi

echo ""
echo "2️⃣  Configurando usuario Git..."
echo "Ingresa tu nombre (Enter para usar 'VetCare Developer'):"
read GIT_NAME
GIT_NAME=${GIT_NAME:-"VetCare Developer"}

echo "Ingresa tu email:"
read GIT_EMAIL
GIT_EMAIL=${GIT_EMAIL:-"dev@vetcare.pro"}

git config user.name "$GIT_NAME"
git config user.email "$GIT_EMAIL"
echo "✅ Usuario configurado: $GIT_NAME <$GIT_EMAIL>"

echo ""
echo "3️⃣  Preparando archivos..."
echo "  • Agregando .gitignore"
echo "  • Agregando vercel.json"
echo "  • Creando DEPLOYMENT_VERCEL.md"
echo "✅ Archivos preparados"

echo ""
echo "4️⃣  Agregando archivos a Git..."
git add .
echo "✅ Archivos agregados"

echo ""
echo "5️⃣  Realizando primer commit..."
git commit -m "Initial commit: VetCare Pro E-Commerce con Next.js, Express y Astro"
echo "✅ Commit realizado"

echo ""
echo "========================================="
echo "  ✨ SIGUIENTES PASOS:"
echo "========================================="
echo ""
echo "1. Crear repositorio en GitHub:"
echo "   https://github.com/new"
echo ""
echo "2. Ejecutar estos comandos:"
echo ""
echo "   git remote add origin https://github.com/TU_USUARIO/vetcare-pro.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Desplegar en Vercel:"
echo "   https://vercel.com/dashboard"
echo ""
echo "========================================="
