# ✅ CHECKLIST DE FUNCIONALIDAD - ANTES DE GITHUB

Usa este checklist para verificar que TODO funciona antes de hacer push a GitHub.

---

## 🟢 PARTE 1: INICIAR SERVIDORES (5 min)

- [ ] **Backend corriendo en puerto 5000**
  ```bash
  # En terminal 1:
  cd server && npm start
  # Debe mostrar: ✅ Servidor VetCare corriendo en http://localhost:5000
  ```

- [ ] **Frontend corriendo en puerto 3000**
  ```bash
  # En terminal 2:
  cd client && npm run dev
  # Debe mostrar: ✓ Ready in X seconds
  ```

- [ ] **Landing corriendo en puerto 4321**
  ```bash
  # En terminal 3:
  cd landing && npm run dev
  # Debe mostrar: ready in XXX ms
  ```

---

## 🟢 PARTE 2: PROBAR API (5 min)

- [ ] **Verificar que API responde**
  ```bash
  # Abrir en navegador:
  http://localhost:5000/api/test
  
  # Debe responder JSON:
  {
    "message": "VetCare API funcionando correctamente",
    "timestamp": "..."
  }
  ```

- [ ] **Verificar que frontend puede conectar a API**
  ```bash
  # En navegador, abre developer tools (F12)
  # Ve a Network tab
  # Carga http://localhost:3000/tienda
  # Debe haber requests a http://localhost:5000/api/productos
  # Sin errores de CORS
  ```

---

## 🟢 PARTE 3: PROBAR TIENDA (10 min)

- [ ] **Frontend carga sin errores**
  - [ ] Abre http://localhost:3000
  - [ ] No hay errores rojos en console
  - [ ] Navbar visible y responsive

- [ ] **Página de tienda funciona**
  - [ ] Abre http://localhost:3000/tienda
  - [ ] Se cargan productos
  - [ ] Busca un producto en el campo de búsqueda
  - [ ] Los resultados filtran correctamente

- [ ] **Carrito funciona**
  - [ ] Haz click en "Agregar al Carrito" en un producto
  - [ ] El icono del carrito muestra el número de items
  - [ ] Abre http://localhost:3000/tienda/carrito
  - [ ] El producto está allí

- [ ] **Carrito persiste**
  - [ ] Recarga la página (F5)
  - [ ] El carrito sigue teniendo los items
  - [ ] Los precios se calculan correctamente

- [ ] **Detalle de producto**
  - [ ] Haz click en un producto
  - [ ] Se abre http://localhost:3000/tienda/producto/[id]
  - [ ] Muestra imagen, descripción, precio
  - [ ] Puedes cambiar cantidad
  - [ ] Botón "Agregar al Carrito" funciona

---

## 🟢 PARTE 4: PROBAR CHECKOUT (5 min)

- [ ] **Acceder a checkout**
  - [ ] Carrito tiene items
  - [ ] Click en "Proceder al Pago"
  - [ ] Se abre formulario de checkout

- [ ] **Formulario de checkout**
  - [ ] Campos: nombre, apellido, email, teléfono, dirección
  - [ ] Todos son accesibles y editables
  - [ ] Botón "Pagar con Stripe" visible

- [ ] **Stripe carga correctamente**
  - [ ] Click en "Pagar con Stripe"
  - [ ] Se abre página de Stripe Checkout
  - [ ] Modo test (visible en interfaz)

- [ ] **Pagar con tarjeta de prueba**
  - [ ] Número: 4242 4242 4242 4242
  - [ ] Expiración: 12/25
  - [ ] CVC: 123
  - [ ] Click "Pay"
  - [ ] Redirige a http://localhost:3000/tienda/pago-exitoso
  - [ ] Mensaje de éxito visible

- [ ] **Confirmación de pago**
  - [ ] Muestra "Pago realizado exitosamente"
  - [ ] Session ID visible
  - [ ] Botón "Volver a la tienda" funciona
  - [ ] Carrito vacío después del pago

---

## 🟢 PARTE 5: PROBAR LANDING PAGE (3 min)

- [ ] **Landing carga**
  - [ ] Abre http://localhost:4321
  - [ ] Sin errores de consola

- [ ] **Secciones visibles**
  - [ ] Hero section con CTA
  - [ ] Features/Beneficios
  - [ ] Testimonios
  - [ ] Call to action
  - [ ] Footer

- [ ] **Links funcionan**
  - [ ] Link a tienda va a http://localhost:3000/tienda
  - [ ] Social links funcionan (si aplica)

---

## 🟢 PARTE 6: VERIFICAR ERRORES (2 min)

### Backend
- [ ] `cd server && npm run lint` (sin errores críticos)
- [ ] `cd server && npm test` (si existen tests)

### Frontend
- [ ] `cd client && npm run lint` (sin errores críticos)
- [ ] Abre http://localhost:3000
- [ ] Abre DevTools (F12) → Console
- [ ] Sin errores rojos

### Landing
- [ ] Abre http://localhost:4321
- [ ] DevTools console limpia

---

## 🟢 PARTE 7: VERIFICAR ARCHIVOS

- [ ] **server/.env** existe y está configurado
- [ ] **client/.env.local** existe y está configurado
- [ ] **server/node_modules** existe
- [ ] **client/node_modules** existe
- [ ] **landing/node_modules** existe
- [ ] **.gitignore** en raíz contiene node_modules/

---

## ✅ TODO VERIFICADO!

Si todas las casillas están ✅, entonces el proyecto está **FUNCIONAL Y LISTO PARA GITHUB**.

### Próximo paso: Push a GitHub

```bash
# En la raíz del proyecto:
git add .
git commit -m "VetCare Pro E-Commerce - Funcional y probado"
git push origin main
```

---

## 🆘 SI ALGO NO FUNCIONA

### Backend no inicia
```bash
# Verificar dependencias
cd server
npm install

# Verificar .env
cat .env | grep DATABASE_URL

# Ver errores detallados
npm start
```

### Frontend no compila
```bash
# Limpiar caché Next.js
cd client
rm -r .next
npm run dev
```

### API no responde
```bash
# Verificar puerto 5000
netstat -ano | findstr :5000  # Windows
lsof -i :5000  # macOS/Linux

# Si algo usa el puerto, matarlo:
taskkill /PID <PID> /F  # Windows
kill -9 <PID>  # macOS/Linux
```

### Carrito no persiste
```bash
# Verificar localStorage en DevTools
# F12 → Application → Local Storage → http://localhost:3000
# Buscar 'cart-store'
```

### Stripe no funciona
```bash
# Verificar claves en:
# client/.env.local → NEXT_PUBLIC_STRIPE_PUBLIC_KEY
# server/.env → STRIPE_SECRET_KEY
```

---

**Generado:** 2025-12-19  
**Estado:** ✅ Listo para GitHub
