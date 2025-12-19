#!/bin/bash

# Script para iniciar todos los servidores de VetCare Pro en Linux/macOS

echo ""
echo "========================================"
echo "   VETCARE PRO - INICIANDO SERVIDORES"
echo "========================================"
echo ""

# Obtener directorio raíz del proyecto
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Función para manejar salida limpia
cleanup() {
    echo ""
    echo "========================================"
    echo "   DETENIENDO SERVIDORES"
    echo "========================================"
    kill $BACKEND_PID $FRONTEND_PID $LANDING_PID 2>/dev/null
    exit 0
}

trap cleanup SIGINT

# Iniciar Backend
echo "[1/3] Iniciando Backend (Puerto 5000)..."
cd server && npm start &
BACKEND_PID=$!
sleep 2

# Iniciar Frontend
echo "[2/3] Iniciando Frontend (Puerto 3000)..."
cd ../client && npm run dev &
FRONTEND_PID=$!
sleep 2

# Iniciar Landing
echo "[3/3] Iniciando Landing Page (Puerto 4321)..."
cd ../landing && npm run dev &
LANDING_PID=$!
sleep 2

echo ""
echo "========================================"
echo "   SERVIDORES INICIADOS"
echo "========================================"
echo ""
echo "URLS:"
echo "   Backend:  http://localhost:5000"
echo "   Frontend: http://localhost:3000"
echo "   Landing:  http://localhost:4321"
echo ""
echo "Presiona Ctrl+C para detener los servidores"
echo ""

# Esperar a que todos los procesos terminen
wait
