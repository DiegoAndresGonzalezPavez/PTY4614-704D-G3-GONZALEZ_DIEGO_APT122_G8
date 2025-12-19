# VetCare Pro - E-Commerce con Next.js y Astro

Sistema integral de gestión veterinaria con tienda e-commerce integrada.

## 📦 Estructura del Proyecto

```
vetcare-pro/
├── client/              # Frontend Next.js con tienda e-commerce
├── server/              # Backend Express con API REST
├── landing/             # Landing page con Astro
└── package.json         # Root package.json
```

## 🚀 Configuración Inicial

### Requisitos
- Node.js 18+ 
- npm o yarn
- PostgreSQL
- Cuenta Stripe (para pagos)
- Cloudinary (para almacenamiento de imágenes)

### 1. Clonar y instalar dependencias

```bash
# Instalar dependencias globales
npm install

# Instalar dependencias del servidor
cd server
npm install

# Instalar dependencias del cliente
cd ../client
npm install

# Instalar dependencias del landing
cd ../landing
npm install
```

### 2. Configurar variables de entorno

#### Server (.env)
```
DATABASE_URL=postgresql://user:password@localhost:5432/vetcare_db
PORT=5000
JWT_SECRET=tu_secreto_jwt
STRIPE_SECRET_KEY=sk_test_...
STRIPE_PUBLIC_KEY=pk_test_...
CLOUDINARY_NAME=tu_cloudinary_name
CLOUDINARY_API_KEY=tu_api_key
CLOUDINARY_API_SECRET=tu_api_secret
FRONTEND_URL=http://localhost:3000
```

#### Client (.env.local)
```
NEXT_PUBLIC_API_URL=http://localhost:5000
```

### 3. Inicializar base de datos

```bash
cd server
npx prisma migrate dev --name init
npx prisma db seed  # Si tienes un seed script
```

## 🛒 Características del E-Commerce

### Para Clientes
- ✅ **Catálogo de Productos**: Visualizar productos con búsqueda y filtros
- ✅ **Carrito de Compras**: Gestión de carrito con localStorage
- ✅ **Checkout Seguro**: Integración con Stripe
- ✅ **Historial de Compras**: Ver órdenes anteriores en el portal
- ✅ **Responsive Design**: Optimizado para móvil y desktop

### Para Administradores
- ✅ **Gestión de Productos**: CRUD completo
- ✅ **Gestión de Órdenes**: Seguimiento de ventas
- ✅ **Reportes**: Estadísticas de ventas

## 🏗️ Estructura de Directorios Next.js

```
client/src/
├── app/
│   ├── tienda/               # Páginas de la tienda
│   │   ├── page.jsx          # Catálogo principal
│   │   ├── carrito/page.jsx  # Carrito de compras
│   │   ├── checkout/page.jsx # Checkout
│   │   ├── pago-exitoso/     # Confirmación de pago
│   │   └── producto/[id]/    # Detalle de producto
│   └── components/
│       └── Navbar.jsx         # Navegación
├── components/
│   └── tienda/
│       ├── ProductCard.jsx    # Card de producto
│       ├── CartItem.jsx       # Item del carrito
│       └── CartIcon.jsx       # Ícono del carrito
└── stores/
    └── cartStore.js           # Zustand store para carrito
```

## 📡 API Endpoints

### Productos
- `GET /api/productos` - Listar todos
- `GET /api/productos/:id` - Detalle
- `POST /api/productos` - Crear
- `PUT /api/productos/:id` - Actualizar
- `DELETE /api/productos/:id` - Eliminar

### Órdenes
- `POST /api/ordenes` - Crear orden
- `GET /api/ordenes/:id` - Obtener orden
- `GET /api/ordenes/cliente/:clienteId` - Órdenes del cliente

## 🚀 Iniciar los Servidores

### Terminal 1 - Backend
```bash
cd server
npm run dev
# Servidor corriendo en http://localhost:5000
```

### Terminal 2 - Frontend Next.js
```bash
cd client
npm run dev
# Cliente corriendo en http://localhost:3000
```

### Terminal 3 - Landing Astro
```bash
cd landing
npm run dev
# Landing corriendo en http://localhost:3001
```

## 💳 Integración con Stripe

### Credenciales de Prueba
- **Tarjeta de prueba exitosa**: 4242 4242 4242 4242
- **Expiración**: 12/25
- **CVC**: 123
- **Código postal**: 12345

Para más tarjetas de prueba: https://stripe.com/docs/testing

## 📱 Componentes Principales

### ProductCard
Muestra un producto con imagen, nombre, precio y botón de agregar al carrito.

```jsx
<ProductCard producto={producto} />
```

### CartItem
Muestra un item del carrito con cantidad y botones de actualización.

```jsx
<CartItem item={item} />
```

### CartIcon
Ícono del carrito con badge de cantidad de items.

```jsx
<CartIcon />
```

## 🎨 Diseño y Estilos

- **Framework CSS**: Tailwind CSS 4
- **Colores principales**: Azul (#0066CC)
- **Responsive**: Mobile-first
- **Componentes**: Tarjetas, botones, inputs, modales

## 🔒 Autenticación y Seguridad

- JWT para autenticación
- Bcrypt para hash de contraseñas
- CORS configurado
- Validación de datos en servidor
- Variables de entorno para credenciales

## 📊 Base de Datos

### Tablas principales
- `clientes` - Información de clientes
- `productos` - Catálogo de productos
- `facturas` - Órdenes/compras
- `mascotas` - Mascotas registradas
- `citas` - Citas veterinarias
- `usuarios` - Administradores

## 🐛 Troubleshooting

### Error: "Cannot find module"
```bash
# Eliminar node_modules e instalar de nuevo
rm -rf node_modules package-lock.json
npm install
```

### Error: "Database connection failed"
- Verificar que PostgreSQL está corriendo
- Verificar DATABASE_URL en .env
- Ejecutar migraciones: `npx prisma migrate dev`

### Error: "Stripe key not found"
- Verificar STRIPE_SECRET_KEY en .env
- Usar claves de prueba (sk_test_)

## 📚 Documentación Adicional

- [Next.js Docs](https://nextjs.org/docs)
- [Astro Docs](https://docs.astro.build)
- [Stripe Docs](https://stripe.com/docs)
- [Zustand Docs](https://github.com/pmndrs/zustand)
- [Tailwind Docs](https://tailwindcss.com/docs)

## 👨‍💻 Desarrollo

### Agregar un nuevo producto
1. En el admin (panel veterinario) o vía API
2. POST `/api/productos` con los datos del producto
3. Aparecerá automáticamente en la tienda

### Personalizar los estilos
- Editar `client/src/app/globals.css` para estilos globales
- Usar clases Tailwind en los componentes
- Configuración de Tailwind en `tailwind.config.js`

## 📝 Licencia

Este proyecto es propiedad de VetCare Pro. Todos los derechos reservados.

## 📧 Contacto

Para soporte o preguntas, contactar a: support@vetcare.pro
