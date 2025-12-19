# 📊 Diagrama de Flujos - E-Commerce VetCare Pro

## Flujo de Datos General

```
┌─────────────────────────────────────────────────────────────────┐
│                         USUARIO CLIENTE                          │
└─────────────────────────────────────────────────────────────────┘
                             ↓
                    ┌────────────────┐
                    │  LANDING PAGE  │ (Astro)
                    │  astro.build   │
                    └────────┬───────┘
                             ↓
        ┌────────────────────────────────────────┐
        │   ¿Desea Comprar o Explorar?          │
        └────┬──────────────────────────────┬───┘
             ↓                              ↓
    ┌─────────────────┐          ┌──────────────────┐
    │  Ver Tienda     │          │  Login/Registro  │
    │ (/tienda)       │          │ (/login)         │
    └────────┬────────┘          └──────┬───────────┘
             ↓                          ↓
    ┌─────────────────────────────────────────┐
    │    CATALOGO DE PRODUCTOS                │
    │    ├─ Búsqueda                          │
    │    ├─ Filtros                           │
    │    └─ ProductCards (Zustand)            │
    └────────┬────────────────────────────────┘
             ↓
    ┌─────────────────────────────────────────┐
    │  DETALLE DE PRODUCTO                    │
    │  ├─ Nombre                              │
    │  ├─ Precio                              │
    │  ├─ Descripción                         │
    │  ├─ Cantidad (±)                        │
    │  └─ [Agregar al Carrito]                │
    └────────┬────────────────────────────────┘
             ↓
    ┌─────────────────────────────────────────┐
    │  CARRITO (localStorage)                 │
    │  ├─ Items agregados                     │
    │  ├─ Subtotales                          │
    │  ├─ [Modificar Cantidades]              │
    │  ├─ [Eliminar Items]                    │
    │  └─ [Proceder al Pago]                  │
    └────────┬────────────────────────────────┘
             ↓
    ┌─────────────────────────────────────────┐
    │  CHECKOUT                               │
    │  ├─ Datos de Envío                      │
    │  │  ├─ Nombre                           │
    │  │  ├─ Email                            │
    │  │  ├─ Teléfono                         │
    │  │  ├─ Dirección                        │
    │  │  └─ Ciudad                           │
    │  ├─ Resumen de Orden                    │
    │  └─ [Proceder al Pago]                  │
    └────────┬────────────────────────────────┘
             ↓
    ┌─────────────────────────────────────────┐
    │  STRIPE CHECKOUT                        │
    │  ├─ Tarjeta de Crédito                  │
    │  ├─ Validación                          │
    │  └─ Procesamiento                       │
    └────────┬────────────────────────────────┘
             ↓
        ¿Pago Exitoso?
        ├─ SÍ ───→ ┌──────────────────────┐
        │          │  PAGO EXITOSO        │
        │          │  ├─ Confirmación     │
        │          │  ├─ Email enviado    │
        │          │  └─ Acceso a Compras │
        │          └──────────────────────┘
        └─ NO ────→ Volver a Checkout
```

---

## Flujo de Datos Back-End

```
┌─────────────────────────────────────────────────────────────┐
│                    NEXT.JS CLIENT                           │
└──────┬──────────────────────────────────┬──────────────────┘
       │ HTTP Requests                    │
       ↓                                  ↓
   ┌────────────────┐            ┌─────────────────┐
   │  GET /api/     │            │ POST /api/      │
   │  productos     │            │ ordenes         │
   │                │            │                 │
   │ Listar todos   │            │ Crear orden con │
   │ Buscar         │            │ cliente + items │
   │ Filtrar        │            │ Generar sesión  │
   └────────┬───────┘            │ Stripe          │
            │                    └────────┬────────┘
            ↓                            ↓
   ┌──────────────────────────────────────────┐
   │         EXPRESS.JS SERVER               │
   │         http://localhost:5000            │
   │                                          │
   │  ┌───────────────────────────────────┐  │
   │  │ RUTAS API                         │  │
   │  ├─ GET  /api/productos              │  │
   │  ├─ GET  /api/productos/:id          │  │
   │  ├─ POST /api/productos              │  │
   │  ├─ PUT  /api/productos/:id          │  │
   │  ├─ DELETE /api/productos/:id        │  │
   │  ├─ POST /api/ordenes                │  │
   │  ├─ GET  /api/ordenes/:id            │  │
   │  └─ GET  /api/ordenes/cliente/:id    │  │
   │                                       │  │
   │  ┌───────────────────────────────────┐  │
   │  │ SERVICIOS                         │  │
   │  ├─ Stripe Service                   │  │
   │  │  └─ createCheckoutSession()       │  │
   │  ├─ Email Service                    │  │
   │  │  └─ sendOrderEmail()              │  │
   │  └─ Prisma Client                    │  │
   │     └─ Operaciones BD                │  │
   │                                       │  │
   │  ┌───────────────────────────────────┐  │
   │  │ MIDDLEWARE                        │  │
   │  ├─ CORS                             │  │
   │  ├─ Auth (JWT)                       │  │
   │  └─ ErrorHandler                     │  │
   └──────┬──────────┬──────────┬──────────┘
          │          │          │
    ┌─────↓──┐  ┌────↓────┐  ┌─↓──────────┐
    │  STRIPE │  │  EMAIL  │  │ PostgreSQL │
    │  (API)  │  │ (Resend)│  │   (DB)     │
    └────────┘  └─────────┘  └────────────┘
```

---

## Arquitectura de Carpetas - Detalles

```
vetcare-pro/
│
├── 📄 package.json (root scripts)
├── 📄 README_ECOMMERCE.md
├── 📄 GUIA_ECOMMERCE.md
├── 📄 CHECKLIST.md
├── 📄 RESUMEN_ECOMMERCE.md
│
├── 🖧 server/
│   ├── server.js (main)
│   ├── routes/
│   │   ├── ordenRoutes.js ⭐ NEW
│   │   ├── productoRoutes.js
│   │   ├── clienteRoutes.js
│   │   └── ... más rutas
│   ├── services/
│   │   ├── stripeService.js (actualizado)
│   │   ├── emailService.js
│   │   └── ...
│   ├── controllers/
│   │   ├── productoController.js
│   │   └── ...
│   ├── middleware/
│   │   └── auth.js
│   ├── prisma/
│   │   ├── schema.prisma
│   │   └── client.js
│   ├── config/
│   ├── .env (crear con valores reales)
│   ├── .env.example ⭐ NEW
│   └── package.json
│
├── 🎨 client/
│   ├── next.config.mjs
│   ├── tailwind.config.js
│   ├── package.json
│   ├── .env.local (crear)
│   ├── .env.example ⭐ NEW
│   │
│   └── src/
│       ├── app/
│       │   ├── layout.js (actualizado)
│       │   ├── globals.css
│       │   ├── page.js
│       │   │
│       │   ├── tienda/ ⭐ NEW
│       │   │   ├── page.jsx (catálogo)
│       │   │   ├── carrito/
│       │   │   │   └── page.jsx
│       │   │   ├── checkout/
│       │   │   │   └── page.jsx
│       │   │   ├── pago-exitoso/
│       │   │   │   └── page.jsx
│       │   │   └── producto/
│       │   │       └── [id]/
│       │   │           └── page.jsx
│       │   │
│       │   ├── admin/ ⭐ NEW
│       │   │   └── productos/
│       │   │       └── page.jsx
│       │   │
│       │   ├── components/ ⭐ NEW
│       │   │   └── Navbar.jsx
│       │   │
│       │   ├── dashboard/
│       │   ├── citas/
│       │   ├── mascotas/
│       │   ├── clientes/
│       │   └── login/
│       │
│       ├── components/
│       │   └── tienda/ ⭐ NEW
│       │       ├── ProductCard.jsx
│       │       ├── CartIcon.jsx
│       │       └── CartItem.jsx
│       │
│       ├── services/
│       │   └── api.js
│       │
│       └── stores/ ⭐ NEW
│           └── cartStore.js (Zustand)
│
└── 🌐 landing/ ⭐ NEW
    ├── astro.config.mjs
    ├── tailwind.config.cjs
    ├── package.json
    ├── tsconfig.json
    │
    ├── public/
    │   └── favicon.svg
    │
    └── src/
        ├── layouts/
        ├── pages/
        │   └── index.astro ⭐ Landing page
        └── styles/
            └── global.css
```

---

## Estado de Componentes

```
┌──────────────────────────────────────────────────────┐
│  ZUSTAND STORE (cartStore.js)                        │
├──────────────────────────────────────────────────────┤
│                                                      │
│  State:                                              │
│  ├─ items: CartItem[]                               │
│  │  └─ {id, nombre, precio, imagen_url, cantidad}  │
│  └─ total: number                                   │
│                                                      │
│  Actions:                                            │
│  ├─ addItem(product)                                │
│  ├─ removeItem(productId)                           │
│  ├─ updateQuantity(productId, cantidad)             │
│  ├─ clearCart()                                     │
│  └─ getCartCount(): number                          │
│                                                      │
│  Persist: localStorage con key 'cart-store'         │
│                                                      │
└──────────────────────────────────────────────────────┘
```

---

## Flujo de Pago Stripe

```
┌─────────────────────────────────────────────────┐
│  CLIENT (Next.js)                               │
│  Usuario completa checkout form                 │
└────────────────┬────────────────────────────────┘
                 │
                 ↓
         ┌──────────────────┐
         │ POST /api/ordenes│
         │ + cliente + items│
         └────────┬─────────┘
                  │
                  ↓
    ┌─────────────────────────────────┐
    │  SERVER (Express)                │
    │  ├─ Validar datos               │
    │  ├─ Crear Cliente en BD         │
    │  ├─ Crear Factura en BD         │
    │  └─ Llamar Stripe Service       │
    └────────┬────────────────────────┘
             │
             ↓
    ┌──────────────────────────────────┐
    │  STRIPE SERVICE                  │
    │  createCheckoutSession({          │
    │    lineItems: [...],             │
    │    success_url: ...,             │
    │    cancel_url: ...,              │
    │    metadata: {...}               │
    │  })                              │
    └────────┬─────────────────────────┘
             │
             ↓ HTTP Request
    ┌──────────────────────────────────┐
    │  STRIPE API                      │
    │  stripe.com/v1/checkout/sessions │
    └────────┬─────────────────────────┘
             │
             ↓ Session URL
    ┌──────────────────────────────────┐
    │  CLIENTE (Navegador)             │
    │  Redirigido a Stripe Checkout    │
    │  ├─ Ingresa tarjeta              │
    │  ├─ Validación                   │
    │  └─ Pago                         │
    └────────┬─────────────────────────┘
             │
        ¿Exitoso?
        ├─ YES ──→ success_url
        │          /tienda/pago-exitoso
        │
        └─ NO ───→ cancel_url
                   /tienda/carrito
```

---

## Ciclo de Vida del Carrito

```
Component Mount
       ↓
useEffect ← Fetch localStorage
       ↓
[Items Loaded]
       ↓
User Actions:
├─ Add → addItem() → update state → save localStorage
├─ Remove → removeItem() → update state → save localStorage
├─ UpdateQty → updateQuantity() → update state → save localStorage
└─ Clear → clearCart() → update state → clear localStorage
       ↓
Component Unmount/Refresh
       ↓
localStorage persists
```

---

## Base de Datos - Relaciones

```
┌──────────────┐
│   Clientes   │
├──────────────┤
│ id (PK)      │
│ nombre       │
│ apellido     │
│ email (UNIQUE)
│ password_hash│
│ telefono     │
│ direccion    │
│ rut (UNIQUE) │
└────────┬─────┘
         │ 1:N
         ↓
┌─────────────────┐      ┌────────────┐
│    Facturas     │      │ Productos  │
├─────────────────┤      ├────────────┤
│ id (PK)         │      │ id (PK)    │
│ id_cliente (FK) │─────→│ nombre     │
│ total           │      │ precio     │
│ fecha_emision   │      │ stock      │
│ estado          │      │ descripción│
│ observaciones   │      │ imagen_url │
└─────────────────┘      └────────────┘
         │
         └─ Items Order (relación)
            ├─ facturaId
            ├─ productoId
            ├─ cantidad
            └─ precio_unitario
```

---

## Estado del Proyecto

```
FRONTEND (Next.js)
  ├─ ✅ Páginas de tienda
  ├─ ✅ Componentes de producto
  ├─ ✅ Carrito funcional
  ├─ ✅ Checkout integrado
  └─ ✅ Navbar actualizado

BACKEND (Express)
  ├─ ✅ Rutas de órdenes
  ├─ ✅ Stripe Service mejorado
  ├─ ✅ Validaciones
  └─ ✅ CORS configurado

DATABASE
  ├─ ✅ Tablas existentes
  ├─ ⚠️ Migración pendiente
  └─ ✅ Schema actualizado

LANDING (Astro)
  ├─ ✅ Página principal
  ├─ ✅ Secciones completas
  ├─ ✅ Responsive design
  └─ ✅ Tailwind integrado

DOCUMENTACIÓN
  ├─ ✅ README_ECOMMERCE.md
  ├─ ✅ GUIA_ECOMMERCE.md
  ├─ ✅ CHECKLIST.md
  ├─ ✅ RESUMEN_ECOMMERCE.md
  └─ ✅ .env.example
```

---

## Matriz de Responsabilidades

| Componente | Ubicación | Responsabilidad |
|-----------|-----------|-----------------|
| ProductCard | client/components | Mostrar producto en catálogo |
| CartIcon | client/components | Mostrar cantidad de items |
| CartItem | client/components | Editar item en carrito |
| cartStore | client/stores | Gestionar estado del carrito |
| /tienda | client/app | Listar todos los productos |
| /tienda/[id] | client/app | Mostrar detalle de producto |
| /tienda/carrito | client/app | Mostrar carrito |
| /tienda/checkout | client/app | Formulario de compra |
| /admin/productos | client/app | Gestión de productos |
| /api/productos | server/routes | CRUD de productos |
| /api/ordenes | server/routes | CRUD de órdenes |
| stripeService | server/services | Sesiones de pago Stripe |

---

## ⚡ Performance Optimizations

- ✅ Lazy loading de imágenes
- ✅ Code splitting en Next.js
- ✅ Caching en localStorage
- ✅ Componentes optimizados
- ✅ Tailwind purged CSS
- ✅ API responses comprimidas

---

Este diagrama representa la estructura completa de tu e-commerce integrado. 🎉
