╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║           🚀 INSTRUCCIONES DE EJECUCIÓN - AHORA MISMO 🚀      ║
║                                                                ║
║                  ¡TODO ESTÁ FUNCIONAL Y LISTO!                ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝


═══════════════════════════════════════════════════════════════════
                   OPCIÓN 1: AUTOMÁTICO (RECOMENDADO)
═══════════════════════════════════════════════════════════════════

🪟 WINDOWS (PowerShell):

  1. Abre PowerShell
  2. Navega a: cd C:\Users\Diego\Documents\vetcare-pro
  3. Ejecuta: .\start-dev.bat
  
  ✅ Se abrirán 3 ventanas automáticamente con:
     - Backend (puerto 5000)
     - Frontend (puerto 3000)
     - Landing (puerto 4321)


🐧 LINUX / 🍎 MAC (Terminal):

  1. Abre terminal
  2. Navega a: cd ~/Documents/vetcare-pro
     (o donde tengas el proyecto)
  3. Ejecuta:
     chmod +x start-dev.sh
     ./start-dev.sh
  
  ✅ Se abrirán 3 procesos en la misma terminal


═══════════════════════════════════════════════════════════════════
                   OPCIÓN 2: MANUAL (TERMINALES SEPARADAS)
═══════════════════════════════════════════════════════════════════

IMPORTANTE: Abre 3 terminales diferentes

TERMINAL 1 - BACKEND:
  ┌─────────────────────────────────────────────────────────────┐
  │ $ cd c:\Users\Diego\Documents\vetcare-pro\server            │
  │ $ npm start                                                 │
  │                                                             │
  │ Esperado: ✅ Servidor corriendo en http://localhost:5000   │
  └─────────────────────────────────────────────────────────────┘

TERMINAL 2 - FRONTEND:
  ┌─────────────────────────────────────────────────────────────┐
  │ $ cd c:\Users\Diego\Documents\vetcare-pro\client            │
  │ $ npm run dev                                               │
  │                                                             │
  │ Esperado: ✓ Ready in X seconds                             │
  │           Local: http://localhost:3000                     │
  └─────────────────────────────────────────────────────────────┘

TERMINAL 3 - LANDING:
  ┌─────────────────────────────────────────────────────────────┐
  │ $ cd c:\Users\Diego\Documents\vetcare-pro\landing           │
  │ $ npm run dev                                               │
  │                                                             │
  │ Esperado: Local http://localhost:4321                      │
  └─────────────────────────────────────────────────────────────┘


═══════════════════════════════════════════════════════════════════
                     ABRIR EN NAVEGADOR
═══════════════════════════════════════════════════════════════════

Una vez que los 3 servidores estén corriendo, abre:

┌─ FRONTEND (TIENDA) ──────────────────────────────────────────┐
│ http://localhost:3000                                        │
│ http://localhost:3000/tienda  ← AQUÍ ESTÁ LA TIENDA         │
│ http://localhost:3000/tienda/carrito  ← CARRITO             │
└──────────────────────────────────────────────────────────────┘

┌─ BACKEND (API) ──────────────────────────────────────────────┐
│ http://localhost:5000/api/test  ← PRUEBA API                │
│ Debe mostrar JSON con timestamp                             │
└──────────────────────────────────────────────────────────────┘

┌─ LANDING (MARKETING) ────────────────────────────────────────┐
│ http://localhost:4321  ← PÁGINA DE INICIO                   │
└──────────────────────────────────────────────────────────────┘


═══════════════════════════════════════════════════════════════════
                    PROBAR LA FUNCIONALIDAD
═══════════════════════════════════════════════════════════════════

PASO 1: Verificar que la tienda carga
  → Abre http://localhost:3000/tienda
  → Debes ver productos en una grilla
  → No debe haber errores rojos en la consola (F12)

PASO 2: Probar carrito
  → Busca un producto o haz scroll
  → Click en "Agregar al Carrito"
  → El icono del carrito (top derecha) muestra "1"

PASO 3: Ver el carrito
  → Click en el icono del carrito
  → O abre http://localhost:3000/tienda/carrito
  → Debes ver el producto agregado

PASO 4: Probar persistencia
  → Presiona F5 (recargar página)
  → El carrito sigue mostrando el producto ✅

PASO 5: Probar checkout
  → Click en "Proceder al Pago"
  → Completa nombre, email, dirección
  → Click en "Pagar con Stripe"

PASO 6: Pagar con tarjeta de prueba
  → Se abre página de Stripe
  → Número: 4242 4242 4242 4242
  → Expiración: 12/25
  → CVC: 123
  → Click "Pay"

PASO 7: Confirmación
  → Te redirige a /tienda/pago-exitoso
  → Muestra "Pago realizado exitosamente"
  → El carrito se vacía


═══════════════════════════════════════════════════════════════════
                  VERIFICAR QUE TODO FUNCIONA
═══════════════════════════════════════════════════════════════════

CHECKLIST RÁPIDO:

Backend:
  ☐ Terminal muestra: "✅ Servidor VetCare corriendo en..."
  ☐ http://localhost:5000/api/test responde JSON
  
Frontend:
  ☐ http://localhost:3000 carga sin errores
  ☐ http://localhost:3000/tienda muestra productos
  ☐ Puedes buscar y filtrar productos
  ☐ Carrito persiste al recargar

Carrito:
  ☐ Puedo agregar productos
  ☐ El icono muestra la cantidad
  ☐ Puedo cambiar cantidades
  ☐ Puedo quitar items
  ☐ Los datos persisten (localStorage)

Pago:
  ☐ Puedo ir a checkout
  ☐ Stripe abre correctamente
  ☐ Pago con tarjeta test funciona
  ☐ Veo confirmación de éxito

Landing:
  ☐ http://localhost:4321 carga
  ☐ Veo secciones de marketing
  ☐ Links funcionan


═══════════════════════════════════════════════════════════════════
                    SI ALGO NO FUNCIONA
═══════════════════════════════════════════════════════════════════

❌ "Backend no inicia"
   → Verifica que el puerto 5000 está libre
   → Comprueba que .env existe en server/
   → Intenta: taskkill /PID <pid> /F  (si algo usa puerto 5000)

❌ "Frontend no compila"
   → Limpia caché: rm -r client/.next
   → Reinstala: cd client && npm install && npm run dev

❌ "Carrito no persiste"
   → Abre DevTools (F12)
   → Application → Local Storage
   → Busca 'cart-store' (debe existir)
   → Si no existe, refresca la página

❌ "Stripe no carga"
   → Verifica NEXT_PUBLIC_STRIPE_PUBLIC_KEY en client/.env.local
   → Debe comenzar con "pk_test_"

❌ "API no responde"
   → Abre http://localhost:5000/api/test en navegador
   → Si no funciona, el backend no está corriendo
   → Revisar terminal del backend por errores


═══════════════════════════════════════════════════════════════════
                     ANTES DE HACER GIT PUSH
═══════════════════════════════════════════════════════════════════

1. Verifica que TODO está funcionando arriba ↑
2. Abre: CHECKLIST_FUNCIONAL.md
3. Sigue cada punto de la lista
4. Marca todo como completado ✅
5. Luego haz:

   $ git add .
   $ git commit -m "VetCare Pro - Funcional y testeado"
   $ git push origin main


═══════════════════════════════════════════════════════════════════
                      DESPUÉS DE GIT PUSH
═══════════════════════════════════════════════════════════════════

Una vez que subiste a GitHub:

1. Lee: DEPLOY_RAPIDO.md
2. Sigue pasos para Vercel
3. Configura Railway para backend
4. ¡Listo para producción!


═══════════════════════════════════════════════════════════════════

Para detener los servidores:
  • Windows: Cierra las 3 ventanas (start-dev.bat)
  • Linux/Mac: Presiona Ctrl+C en la terminal (./start-dev.sh)

═══════════════════════════════════════════════════════════════════

                    ¡TODO ESTÁ LISTO! 🎉

                Ejecuta ahora: start-dev.bat
                            o: start-dev.sh

═══════════════════════════════════════════════════════════════════
