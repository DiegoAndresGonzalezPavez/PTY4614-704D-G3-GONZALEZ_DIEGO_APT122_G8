# 🚀 Desplegar en Vercel con GitHub

## Paso 1: Crear Repositorio en GitHub

### 1.1 Inicializar Git localmente

```bash
cd c:\Users\Diego\Documents\vetcare-pro

# Inicializar repositorio
git init

# Configurar usuario (si no está configurado)
git config user.name "Tu Nombre"
git config user.email "tu.email@ejemplo.com"

# Agregar todos los archivos
git add .

# Primer commit
git commit -m "Initial commit: VetCare Pro E-Commerce con Next.js, Express y Astro"
```

### 1.2 Crear repositorio en GitHub

1. Ve a https://github.com/new
2. Nombre: `vetcare-pro` (o el que prefieras)
3. Descripción: "Sistema integral veterinario con tienda e-commerce"
4. Privado o Público: Tu preferencia
5. **NO** inicialices README (ya tenemos)
6. Click en "Create repository"

### 1.3 Conectar con GitHub

```bash
# Agregar remoto origin
git remote add origin https://github.com/TU_USUARIO/vetcare-pro.git

# Cambiar rama a main (Vercel usa main por defecto)
git branch -M main

# Hacer push inicial
git push -u origin main
```

---

## Paso 2: Preparar para Vercel

### 2.1 Estructura para monorepo

Tu proyecto ya está estructurado como monorepo (server, client, landing). Vercel puede manejar esto automáticamente.

### 2.2 Variables de entorno en Vercel

Necesitarás agregar en Vercel Dashboard:

**Para el Client (Next.js):**
```
NEXT_PUBLIC_API_URL=https://tu-api-produccion.vercel.app
NEXT_PUBLIC_STRIPE_PUBLIC_KEY=pk_live_... (o pk_test_)
```

**Para el Server (Express):**
```
DATABASE_URL=postgresql://user:password@host/db
STRIPE_SECRET_KEY=sk_live_... (o sk_test_)
STRIPE_PUBLIC_KEY=pk_live_... (o pk_test_)
FRONTEND_URL=https://tu-frontend-produccion.vercel.app
JWT_SECRET=tu_secreto_seguro
CLOUDINARY_NAME=...
CLOUDINARY_API_KEY=...
CLOUDINARY_API_SECRET=...
```

---

## Paso 3: Desplegar en Vercel

### 3.1 Opción A: Mediante Vercel Dashboard (Recomendado)

1. Ve a https://vercel.com/dashboard
2. Click en "Add New..." → "Project"
3. Selecciona "Import Git Repository"
4. Conecta tu cuenta GitHub (si no está conectada)
5. Busca y selecciona `vetcare-pro`
6. Click en "Import"

### 3.2 Configuración del Proyecto

**Framework:** Detectará automáticamente Next.js

**Root Directory:** 
- Para el Client (Next.js): `./client`

**Build Command:**
```bash
npm run build
```

**Output Directory:**
```bash
.next
```

**Environment Variables:**
- Agrega todas las variables mencionadas en **Paso 2.2**

### 3.3 Deploy

- Click en "Deploy"
- Espera a que termine (3-5 minutos)
- Vercel te dará una URL

---

## Paso 4: Desplegar el Backend (Express)

El backend necesita un servicio diferente. Tienes opciones:

### Opción A: Railway (Recomendado para Node.js)

1. Ve a https://railway.app/
2. Conecta GitHub
3. Crea nuevo proyecto
4. Selecciona el repositorio
5. Agrega variables de entorno
6. Deploy automático

### Opción B: Render

1. Ve a https://render.com/
2. New → Web Service
3. Conecta GitHub
4. Selecciona el repositorio
5. Root Directory: `server`
6. Build Command: `npm install && npx prisma migrate deploy`
7. Start Command: `npm start`

### Opción C: Vercel Functions (serverless)

Es posible pero requiere reconfigurar el backend.

---

## Paso 5: Desplegar el Landing (Astro)

Si quieres el landing en un subdominio:

1. Ve a https://vercel.com/dashboard
2. Crea un nuevo proyecto
3. Importa el mismo repositorio
4. Root Directory: `./landing`
5. Framework: Astro
6. Deploy

---

## Estructura Post-Despliegue

```
vetcare-pro (GitHub)
├── Backend  → Railway/Render
│   └── API en https://api-vetcare.railway.app
├── Frontend → Vercel
│   └── App en https://vetcare-pro.vercel.app
└── Landing → Vercel
    └── Marketing en https://vetcare-landing.vercel.app
```

---

## Verificación Post-Despliegue

### ✅ Checklist

- [ ] Frontend carga correctamente
- [ ] API responde desde el server
- [ ] Variables de entorno están configuradas
- [ ] CORS permite requests desde el frontend
- [ ] Base de datos está migrada en producción
- [ ] Stripe está en modo live (o test)
- [ ] Landing page es accesible
- [ ] Emails se envían correctamente (Resend)

---

## Actualizaciones Futuras

Cada push a `main` en GitHub desplegará automáticamente:

```bash
# Local
git add .
git commit -m "Descripción del cambio"
git push origin main

# Vercel/Railway/Render detectará el cambio y desplegará automáticamente
```

---

## URLs Importantes

| Recurso | URL |
|---------|-----|
| GitHub | https://github.com/TU_USUARIO/vetcare-pro |
| Vercel (Client) | https://tu-proyecto.vercel.app |
| Railway (Backend) | https://api-tu-proyecto.railway.app |
| Landing | https://tu-proyecto-landing.vercel.app |

---

## Troubleshooting

### Error: "DATABASE_URL not found"
- Verifica que esté en variables de entorno del servicio

### Error: "CORS blocked"
- Asegúrate que FRONTEND_URL en backend apunte a tu dominio Vercel

### Error: "Build failed"
- Revisa logs en el dashboard
- Verifica que `package.json` sea correcto
- Comprueba scripts de build

### Error: "Stripe key invalid"
- Usa claves correctas (sk_test_/pk_test_ para testing, sk_live_/pk_live_ para producción)

---

## Próximos Pasos

1. ✅ Inicializar Git y GitHub
2. ✅ Conectar Vercel
3. ✅ Desplegar Client (Next.js)
4. ✅ Desplegar Server (Railway/Render)
5. ✅ Desplegar Landing (Astro en Vercel)
6. ✅ Configurar dominio personalizado
7. ✅ SSL/HTTPS automático
8. ✅ CI/CD automático

---

**Tiempo estimado:** 30-45 minutos para tener todo en producción

**Última actualización:** Diciembre 2025
