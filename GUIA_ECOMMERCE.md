# 🛒 Guía de Uso - E-Commerce VetCare Pro

## Estructura General

VetCare Pro es una plataforma integral que combina:
- **Sistema Veterinario**: Gestión de citas, mascotas, historial médico
- **Tienda E-Commerce**: Venta de productos veterinarios
- **Landing Page**: Sitio de marketing con Astro

## 📍 Rutas Principales

### Cliente (Next.js)
```
http://localhost:3000/
├── /tienda                    # Catálogo de productos
├── /tienda/carrito           # Carrito de compras
├── /tienda/checkout          # Checkout
├── /tienda/pago-exitoso      # Confirmación de pago
├── /tienda/producto/[id]     # Detalle de producto
├── /dashboard                # Dashboard veterinario
├── /citas                     # Gestión de citas
├── /mascotas                 # Gestión de mascotas
├── /clientes                 # Gestión de clientes
├── /login                    # Iniciar sesión
└── /admin/productos          # Admin de productos
```

### Landing (Astro)
```
http://localhost:3001/
└── /                         # Landing page principal
```

## 🛍️ Flujo de Compra

### 1. Explorar Tienda
```
1. Usuario accede a /tienda
2. Ve catálogo de productos con filtro de búsqueda
3. Puede hacer clic en cualquier producto para ver detalles
```

### 2. Carrito de Compras
```
1. Usuario agrega productos al carrito
2. El carrito se guarda en localStorage (persiste en navegador)
3. Usuario ve el ícono del carrito con cantidad de items
4. Accede a /tienda/carrito para ver detalles
```

### 3. Checkout
```
1. Usuario completa formulario de envío
   - Nombre, Apellido
   - Email, Teléfono
   - Dirección, Ciudad, Código Postal
2. Revisa resumen de orden
3. Procede al pago
```

### 4. Pago con Stripe
```
1. Usuario es redirigido a Stripe Checkout
2. Ingresa datos de tarjeta
3. Completa el pago
4. Es redirigido a /tienda/pago-exitoso
```

### 5. Confirmación
```
1. Usuario recibe confirmación visual en pantalla
2. Recibe email con detalles de orden
3. Puede ver sus compras en /portal-cliente/mis-facturas
```

## 💳 Tarjetas de Prueba para Stripe

### Transacción Exitosa
```
Número: 4242 4242 4242 4242
Expiración: 12/25 o posterior
CVC: 123
Código Postal: Cualquiera
```

### Transacción Declinada
```
Número: 4000 0000 0000 0002
Expiración: 12/25 o posterior
CVC: 123
```

## 🏪 Gestión de Productos (Admin)

### Agregar Producto

**Ruta**: `/admin/productos`

**Campos requeridos**:
- Nombre (text)
- Descripción (textarea)
- Precio (number)
- Stock (number)
- URL de Imagen (url)

**Ejemplo**:
```json
{
  "nombre": "Alimento para Perros Premium",
  "descripcion": "Alimento de alta calidad con proteínas y vitaminas",
  "precio": 29990,
  "stock": 50,
  "imagen_url": "https://ejemplo.com/imagen.jpg"
}
```

### Mediante API

```bash
curl -X POST http://localhost:5000/api/productos \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "Medicamento Veterinario",
    "descripcion": "Antibiótico para mascotas",
    "precio": 15000,
    "stock": 100,
    "imagen_url": "https://ejemplo.com/imagen.jpg"
  }'
```

## 📱 Componentes Principales

### ProductCard
Componente que muestra un producto en el catálogo.

**Ubicación**: `client/src/components/tienda/ProductCard.jsx`

**Props**:
```jsx
<ProductCard 
  producto={{
    id: 1,
    nombre: "Producto",
    precio: 10000,
    descripcion: "Descripción",
    imagen_url: "url"
  }}
/>
```

### CartIcon
Muestra el ícono del carrito con cantidad de items.

**Ubicación**: `client/src/components/tienda/CartIcon.jsx`

**Uso**:
```jsx
<CartIcon />
```

### CartItem
Muestra un item en el carrito de compras.

**Ubicación**: `client/src/components/tienda/CartItem.jsx`

**Props**:
```jsx
<CartItem 
  item={{
    id: 1,
    nombre: "Producto",
    precio: 10000,
    cantidad: 2,
    imagen_url: "url"
  }}
/>
```

## 📊 Estado del Carrito (Zustand)

### Usar el Store

```jsx
import { useCartStore } from '@/stores/cartStore';

export default function Component() {
  // Obtener estado
  const items = useCartStore((state) => state.items);
  const total = useCartStore((state) => state.total);
  
  // Acciones
  const addItem = useCartStore((state) => state.addItem);
  const removeItem = useCartStore((state) => state.removeItem);
  const updateQuantity = useCartStore((state) => state.updateQuantity);
  const clearCart = useCartStore((state) => state.clearCart);
  const cartCount = useCartStore((state) => state.getCartCount());

  return (
    <div>
      <p>Items en carrito: {cartCount}</p>
      <p>Total: ${total.toLocaleString('es-CL')}</p>
    </div>
  );
}
```

### Métodos disponibles

```javascript
// Agregar producto
addItem({
  id: 1,
  nombre: "Producto",
  precio: 10000,
  imagen_url: "url",
  descripcion: "desc"
});

// Eliminar producto
removeItem(productId);

// Actualizar cantidad
updateQuantity(productId, newQuantity);

// Vaciar carrito
clearCart();

// Obtener cantidad total de items
getCartCount();
```

## 🔐 Variables de Entorno Necesarias

### Server (.env)
```
DATABASE_URL=postgresql://user:password@localhost:5432/vetcare_pro
PORT=5000
STRIPE_SECRET_KEY=sk_test_...
STRIPE_PUBLIC_KEY=pk_test_...
CLOUDINARY_NAME=...
CLOUDINARY_API_KEY=...
CLOUDINARY_API_SECRET=...
FRONTEND_URL=http://localhost:3000
```

### Client (.env.local)
```
NEXT_PUBLIC_API_URL=http://localhost:5000
NEXT_PUBLIC_STRIPE_PUBLIC_KEY=pk_test_...
```

## 🎨 Personalización

### Cambiar Colores
Editar `client/tailwind.config.js`:
```js
export default {
  theme: {
    extend: {
      colors: {
        primary: '#0066CC',  // Azul actual
        // Agregar más colores
      }
    }
  }
}
```

### Cambiar Layout
Editar `client/src/app/layout.js` para cambiar la estructura general.

### Cambiar Landing
Editar `landing/src/pages/index.astro` para personalizar el landing page.

## 📱 Responsive Design

### Breakpoints Tailwind
- `sm`: 640px
- `md`: 768px
- `lg`: 1024px
- `xl`: 1280px
- `2xl`: 1536px

### Ejemplo de uso
```jsx
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
  {/* 1 columna en móvil, 2 en tablet, 4 en desktop */}
</div>
```

## 🐛 Debugging

### Ver estado del carrito en consola
```javascript
// En cualquier componente que use useCartStore
const items = useCartStore((state) => state.items);
console.log('Carrito:', items);
```

### Ver requests a API
```javascript
// Abrir DevTools (F12) → Network
// Filtra por "fetch" o "xhr"
```

### Verificar localStorage
```javascript
// En consola del navegador
localStorage.getItem('cart-store')
```

## 📚 Recursos Útiles

- [Next.js Documentation](https://nextjs.org/docs)
- [Astro Documentation](https://docs.astro.build)
- [Stripe Testing](https://stripe.com/docs/testing)
- [Tailwind CSS](https://tailwindcss.com)
- [Zustand](https://github.com/pmndrs/zustand)

## ✅ Checklist de Implementación

- [x] Crear catálogo de productos
- [x] Implementar carrito de compras con Zustand
- [x] Crear componentes de tienda
- [x] Integrar Stripe para pagos
- [x] Crear API de órdenes
- [x] Implementar checkout
- [x] Crear landing page con Astro
- [ ] Agregar testimonios de clientes reales
- [ ] Implementar reviews de productos
- [ ] Agregar wishlist/favoritos
- [ ] Sistema de cupones de descuento
- [ ] Notificaciones por email
- [ ] Seguimiento de órdenes

---

**Última actualización**: Diciembre 2025
**Versión**: 1.0.0
