# 🚀 Quick Start - E-Commerce VetCare Pro

## ⏱️ 5 Minutos para Empezar

### 1️⃣ Instalar Dependencias (2 min)

```bash
cd c:\Users\Diego\Documents\vetcare-pro

# Instalar todo
npm install

# Instalar específicos si es necesario
cd server && npm install
cd ../client && npm install
cd ../landing && npm install
```

### 2️⃣ Configurar Variables de Entorno (2 min)

#### Server (.env)
```bash
cd server
cp .env.example .env
```

**Editar server/.env** con tus valores:
```
DATABASE_URL=postgresql://user:password@localhost:5432/vetcare_db
PORT=5000
STRIPE_SECRET_KEY=sk_test_...       # De Stripe Dashboard
STRIPE_PUBLIC_KEY=pk_test_...       # De Stripe Dashboard
FRONTEND_URL=http://localhost:3000
JWT_SECRET=tu_secreto_aleatorio
```

#### Client (.env.local)
```bash
cd ../client
cp .env.example .env.local
```

**Editar client/.env.local**:
```
NEXT_PUBLIC_API_URL=http://localhost:5000
```

### 3️⃣ Iniciar Servidores (1 min)

**Opción A: Scripts Automáticos (Recomendado)**

```bash
# Windows - Ejecuta desde el explorador o PowerShell
start-dev.bat

# macOS/Linux
chmod +x start-dev.sh
./start-dev.sh
```

**Opción B: Manual en Terminales Separadas**

```bash
# Terminal 1 - Backend
cd server && npm start

# Terminal 2 - Frontend  
cd client && npm run dev

# Terminal 3 - Landing
cd landing && npm run dev
```

### 4️⃣ Base de Datos (Opcional)

Solo si necesitas limpiar y recrear la base de datos:

```bash
cd server
npx prisma migrate dev
```

## 🎯 URLs de los Servidores

```
Backend API:  http://localhost:5000
Frontend UI:  http://localhost:3000
Landing Page: http://localhost:4321
```

## 🛍️ Usar la Tienda

### Paso 1: Agregar Productos
```bash
# Opción A: Por interfaz
1. Ir a http://localhost:3000/admin/productos
2. Completar formulario
3. Crear producto

# Opción B: Por API
curl -X POST http://localhost:5000/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Alimento para Perros",
    "descripcion": "Alimento premium",
    "precio": 29990,
    "stock": 50,
    "imagen_url": "https://via.placeholder.com/300?text=Alimento"
  }'
```

### Paso 2: Explorar Tienda
```
http://localhost:3000/tienda
```

### Paso 3: Agregar al Carrito
- Busca un producto
- Haz clic en "Agregar"
- Ver carrito: icono 🛒 arriba a la derecha

### Paso 4: Checkout
```
http://localhost:3000/tienda/carrito
→ [Proceder al pago]
→ http://localhost:3000/tienda/checkout
→ Completar datos
→ [Proceder al pago]
```

### Paso 5: Pago de Prueba
**En Stripe Checkout:**
- Tarjeta: `4242 4242 4242 4242`
- Expiración: `12/25`
- CVC: `123`
- Postal: `12345`

**Resultado:**
✅ Confirmación en http://localhost:3000/tienda/pago-exitoso

## 📁 Archivos Importantes

| Archivo | Descripción |
|---------|-------------|
| `README_ECOMMERCE.md` | Documentación técnica completa |
| `GUIA_ECOMMERCE.md` | Guía de usuario |
| `CHECKLIST.md` | Verificación de setup |
| `DIAGRAMA_ARQUITECTURA.md` | Diagramas de flujos |
| `server/.env` | Variables del backend |
| `client/.env.local` | Variables del frontend |

## 🔍 Verificar que Todo Funciona

### Backend OK
```bash
curl http://localhost:5000/api/test
# Debería retornar: { message: "VetCare API funcionando correctamente" }
```

### Frontend OK
```
http://localhost:3000
# Debería cargar la página principal
```

### Landing OK
```
http://localhost:3001
# Debería mostrar landing page
```

### Productos OK
```bash
curl http://localhost:5000/api/productos
# Debería retornar array de productos (vacío si no hay)
```

## 🛠️ Troubleshooting Rápido

### Error: "Cannot find module"
```bash
# En la carpeta afectada
rm -rf node_modules package-lock.json
npm install
```

### Error: "Database connection failed"
```bash
# 1. Verificar PostgreSQL está corriendo
# 2. Verificar DATABASE_URL en .env
# 3. Ejecutar:
cd server
npx prisma migrate dev
```

### Error: "Port already in use"
```bash
# Cambiar puerto en server/.env
# O matar proceso:
# En PowerShell:
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

### Error: "API not responding"
```bash
# Verificar CORS en server.js
# Verificar NEXT_PUBLIC_API_URL en client/.env.local
# Debe ser: http://localhost:5000 (sin trailing slash)
```

## 📊 Estructura de Datos Esperada

### Producto en BD
```json
{
  "id": 1,
  "nombre": "Alimento para Perros",
  "descripcion": "Alimento premium con proteínas",
  "precio": "29990.00",
  "stock": 50,
  "imagen_url": "https://...",
  "activo": true,
  "fecha_creacion": "2025-12-19T10:30:00Z"
}
```

### Item en Carrito
```json
{
  "id": 1,
  "nombre": "Alimento para Perros",
  "precio": 29990,
  "imagen_url": "https://...",
  "descripcion": "...",
  "cantidad": 2
}
```

### Orden Creada
```json
{
  "sessionUrl": "https://checkout.stripe.com/pay/cs_test_...",
  "facturaId": 1,
  "clienteId": 1
}
```

## 💡 Tips Útiles

### Limpiar carrito
```javascript
// En consola del navegador
localStorage.clear()
```

### Ver estado del carrito
```javascript
// En consola del navegador
JSON.parse(localStorage.getItem('cart-store'))
```

### Reset base de datos
```bash
cd server
npx prisma migrate reset
npx prisma migrate dev
```

### Agregar múltiples productos rápido
```bash
# Script bash (crear archivo add-products.sh)
for i in {1..5}; do
  curl -X POST http://localhost:5000/api/productos \
    -H "Content-Type: application/json" \
    -d "{
      \"nombre\": \"Producto $i\",
      \"descripcion\": \"Descripción del producto $i\",
      \"precio\": $((10000 + i * 1000)),
      \"stock\": $((50 + i * 10)),
      \"imagen_url\": \"https://via.placeholder.com/300?text=Producto+$i\"
    }"
done
```

## 🎓 Primeros Pasos Recomendados

1. ✅ Instalar dependencias
2. ✅ Configurar .env files
3. ✅ Migrar base de datos
4. ✅ Iniciar servidores
5. ✅ Agregar 2-3 productos de prueba
6. ✅ Probar flujo completo de compra
7. ✅ Revisar documentación detallada
8. ✅ Personalizar colores/estilos

## 📞 Ayuda Rápida

### Problemas Comunes
- **Carrito vacío después de recargar**: Verificar localStorage activado
- **Stripe rechaza tarjeta**: Usar `4242 4242 4242 4242`
- **API retorna 404**: Verificar ruta exacta en servidor
- **Imagen no carga**: Verificar URL en producto

### Links Útiles
- Stripe Testing: https://stripe.com/docs/testing
- Next.js Docs: https://nextjs.org/docs
- Astro Docs: https://docs.astro.build
- Zustand: https://github.com/pmndrs/zustand

## ✨ Ya Estás Listo

¡Tu tienda e-commerce está operativa! 🎉

Próximos pasos:
- Agregar más productos
- Personalizar diseño (colores, logos)
- Configurar email notifications
- Agregar métodos de envío
- Implementar reviews de productos

---

**¿Necesitas ayuda?** Consulta:
- `README_ECOMMERCE.md` - Referencia completa
- `GUIA_ECOMMERCE.md` - Tutorial detallado
- `DIAGRAMA_ARQUITECTURA.md` - Entender la estructura

¡Feliz desarrollo! 🚀
