# 🚀 DESPLIEGUE EN VERCEL - GUÍA RÁPIDA

## ⏱️ 3 Pasos Principales

### 🔷 PASO 1: GitHub (10 min)

**Opción Windows (Recomendado):**
```bash
# En PowerShell, desde la raíz del proyecto:
.\setup-github.bat
```

**O manualmente:**
```bash
cd c:\Users\Diego\Documents\vetcare-pro

git init
git config user.name "Tu Nombre"
git config user.email "tu.email@gmail.com"

git add .
git commit -m "Initial commit: VetCare Pro E-Commerce"
```

**Crear repositorio en GitHub:**
1. Ve a https://github.com/new
2. Nombre: `vetcare-pro`
3. Click "Create repository"

**Conectar con GitHub:**
```bash
git remote add origin https://github.com/TU_USUARIO/vetcare-pro.git
git branch -M main
git push -u origin main
```

---

### 🔷 PASO 2: Vercel - Frontend (10 min)

**Desplegar el Cliente (Next.js):**

1. Ve a https://vercel.com/dashboard
2. Click "Add New..." → "Project"
3. Conecta GitHub (si necesario)
4. Selecciona el repositorio `vetcare-pro`
5. Click "Import"

**Configuración:**
- **Framework Preset:** Next.js (detección automática)
- **Root Directory:** `client`
- **Build Command:** `npm run build`
- **Output Directory:** `.next`

**Agregar Variables de Entorno:**
```
NEXT_PUBLIC_API_URL=https://tu-backend.com
NEXT_PUBLIC_STRIPE_PUBLIC_KEY=pk_test_... (o pk_live_)
```

6. Click "Deploy"
7. ¡Listo! Tu frontend estará en https://vetcare-pro.vercel.app (o similar)

---

### 🔷 PASO 3: Backend - Express (15 min)

Tu backend NO puede ir en Vercel (Vercel es solo para frontend).

**Opción A: Railway (Recomendado)**

1. Ve a https://railway.app/
2. Click "Start New Project"
3. Selecciona "Deploy from GitHub"
4. Conecta GitHub y selecciona tu repositorio
5. Click "Add Variables"

**Variables necesarias:**
```
DATABASE_URL=postgresql://user:pass@host/db
STRIPE_SECRET_KEY=sk_test_... (o sk_live_)
STRIPE_PUBLIC_KEY=pk_test_... (o pk_live_)
FRONTEND_URL=https://vetcare-pro.vercel.app
JWT_SECRET=tu-secreto-super-seguro
CLOUDINARY_NAME=...
CLOUDINARY_API_KEY=...
CLOUDINARY_API_SECRET=...
```

6. Click "Deploy"
7. Tu API estará en algo como: https://api-vetcare-pro.railway.app

---

## ✅ Checklist Rápido

### Antes de desplegar:
- [ ] Git iniciado: `git status`
- [ ] Primer commit hecho
- [ ] Repositorio en GitHub creado
- [ ] Variables `.env` configuradas localmente

### En Vercel (Frontend):
- [ ] Proyecto creado
- [ ] Variables NEXT_PUBLIC_* agregadas
- [ ] Build exitoso
- [ ] URL funciona

### En Railway (Backend):
- [ ] Proyecto creado
- [ ] Variables de entorno agregadas
- [ ] Build exitoso
- [ ] Migraciones de BD ejecutadas

### Después de desplegar:
- [ ] Actualizar NEXT_PUBLIC_API_URL en Vercel con URL de Railway
- [ ] Probar tienda: comprar producto
- [ ] Verificar Stripe en modo test/live
- [ ] Revisar logs en Vercel y Railway

---

## 🔗 URLs Finales

```
Frontend:    https://vetcare-pro.vercel.app
Backend API: https://api-vetcare-pro.railway.app
GitHub:      https://github.com/TU_USUARIO/vetcare-pro
```

---

## 📝 Variables Críticas

### Client (.env.local en Vercel):
```
NEXT_PUBLIC_API_URL=https://api-vetcare-pro.railway.app
NEXT_PUBLIC_STRIPE_PUBLIC_KEY=pk_test_...
```

### Server (.env en Railway):
```
DATABASE_URL=postgresql://...
STRIPE_SECRET_KEY=sk_test_...
FRONTEND_URL=https://vetcare-pro.vercel.app
```

**Importante:** Si cambias una URL, actualiza la otra también.

---

## 🆘 Troubleshooting Rápido

| Problema | Solución |
|----------|----------|
| "DATABASE_URL not found" | Verifica variables en Railway dashboard |
| "CORS error" | Comprueba FRONTEND_URL en backend |
| "Build failed" | Revisa logs en dashboard de Vercel/Railway |
| "API no responde" | Verifica que Railway está corriendo |
| "Stripe rechaza" | Usa claves test (sk_test_, pk_test_) |

---

## 🎯 Próximos Pasos

1. **HOY:** Desplegar en GitHub y Vercel (30 min)
2. **ESTA SEMANA:** Configurar dominio personalizado
3. **PRÓXIMAS 2 SEMANAS:** Setup SSL, emails en producción

---

## 📚 Recursos

- **DEPLOYMENT_VERCEL.md** - Documentación completa
- **Vercel Docs:** https://vercel.com/docs
- **Railway Docs:** https://docs.railway.app/
- **GitHub Docs:** https://docs.github.com/

---

**¡Listo para desplegar! 🚀**
