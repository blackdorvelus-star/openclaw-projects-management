# 🚀 PROJETS PARALLÈLES - JURISSCAN & LYSS

## 📊 ÉTAT DU SYSTÈME

### ✅ **MIGRATION RÉUSSIE**
- **Workspace** : `D:\OpenClaw-Projects\`
- **Projets** : `D:\OpenClaw-Projects\mes-projets\`
- **OpenClaw configuré** : ✅ Oui (15:12, 2026-04-01)
- **Espace D:** : 485 Go libre
- **Espace C:** : 7,7 Go libre

### 📁 **PROJETS DISPONIBLES**

#### 1. **Jurisscan** (`jurisscan-7393c5ef-main\`)
- **Description** : Analyse juridique automatisée
- **Port** : 3000
- **URL** : http://localhost:3000
- **Chemin** : `D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main\`
- **État** : ✅ Présent sur D:

#### 2. **Lyss** (`lyss\`)
- **Description** : Assistant administratif/CRM
- **Port** : 3001
- **URL** : http://localhost:3001
- **Chemin** : `D:\OpenClaw-Projects\mes-projets\lyss\`
- **État** : ✅ Présent sur D:

## 🎮 **SYSTÈME DE GESTION PARALLÈLE**

### **📊 DASHBOARD INTERACTIF**
```powershell
# Lancement du dashboard
powershell -File "D:\OpenClaw-Projects\dashboard-projets.ps1"

# Ou avec démarrage automatique
powershell -File "D:\OpenClaw-Projects\dashboard-projets.ps1" -AutoStart
```

### **🚀 LANCEUR BATCH**
```batch
# Fichier : start-projets.bat
# Double-clic pour démarrer
D:\OpenClaw-Projects\start-projets.bat
```

### **🤖 SKILL OPENCLAW**
```yaml
# Fichier : skill-projets-paralleles.yml
# Intégration avec OpenClaw
```

## 🔧 **COMMANDES DISPONIBLES**

### **Via Dashboard (Powershell)**
```
1 - Démarrer Jurisscan
2 - Démarrer Lyss
3 - Démarrer TOUS les projets
4 - Arrêter Jurisscan
5 - Arrêter Lyss
6 - Arrêter TOUT
7 - Installer dépendances Jurisscan
8 - Installer dépendances Lyss
9 - Installer TOUTES les dépendances
R - Rafraîchir le dashboard
Q - Quitter
```

### **Via OpenClaw**
```
"dashboard projets"        # Affiche le dashboard
"démarrer projets"         # Démarre les deux
"arrêter projets"          # Arrête tout
"état projets"            # Vérifie l'état
"installer dépendances"   # Installe les dépendances
"ouvrir projets"          # Ouvre dans VS Code
```

## ⚙️ **INSTALLATION & CONFIGURATION**

### **1. Vérifier les dépendances**
```powershell
cd "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main"
# Si bun.lock existe : bun install
# Sinon : npm install

cd "D:\OpenClaw-Projects\mes-projets\lyss"
# Si bun.lock existe : bun install
# Sinon : npm install
```

### **2. Démarrer les projets**
```powershell
# Méthode 1 : Dashboard interactif
powershell -File "D:\OpenClaw-Projects\dashboard-projets.ps1"

# Méthode 2 : En arrière-plan
start-projets.bat
```

### **3. Accéder aux projets**
- **Jurisscan** : http://localhost:3000
- **Lyss** : http://localhost:3001

## 📈 **MONITORING**

### **Vérifier l'état en temps réel**
```powershell
# Vérifier les processus
Get-Process node | Where-Object { $_.Path -like "*jurisscan*" -or $_.Path -like "*lyss*" }

# Vérifier les ports
netstat -ano | findstr ":3000 :3001"
```

### **Logs des projets**
```powershell
# Suivre les logs (si démarré avec npm run dev)
# Les logs apparaissent dans les fenêtres PowerShell
```

## 🛠️ **DÉPANNAGE**

### **Problèmes courants :**

#### **❌ "Port déjà utilisé"**
```powershell
# Trouver le processus utilisant le port
netstat -ano | findstr ":3000"
# Tuer le processus
taskkill /PID <PID> /F
```

#### **❌ "Dépendances manquantes"**
```powershell
# Réinstaller les dépendances
cd "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main"
rmdir node_modules /S /Q
npm install
```

#### **❌ "Projet introuvable"**
```powershell
# Vérifier le chemin
Test-Path "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main"
# Si faux, vérifier la copie depuis C:
```

## 🎯 **PROCHAINES ÉTAPES**

### **Court terme :**
1. ✅ Vérifier que les projets démarrent
2. ✅ Tester les URLs (localhost:3000, localhost:3001)
3. ✅ Configurer le skill OpenClaw

### **Moyen terme :**
1. Automatiser les tests
2. Configurer CI/CD
3. Ajouter monitoring avancé

### **Long terme :**
1. Déploiement en production
2. Scaling horizontal
3. Intégration avec d'autres services

## 📞 **SUPPORT**

### **Fichiers créés :**
- `dashboard-projets.ps1` - Dashboard interactif
- `start-projets.bat` - Lanceur batch
- `skill-projets-paralleles.yml` - Skill OpenClaw
- `README-projets-paralleles.md` - Documentation

### **Emplacements :**
- **Tout est dans** : `D:\OpenClaw-Projects\`
- **Projets dans** : `D:\OpenClaw-Projects\mes-projets\`
- **OpenClaw config** : `D:\OpenClaw-Projects\.openclaw\`

---

**🚀 PRÊT POUR LE DÉMARRAGE PARALLÈLE !**

**Exécute :** `D:\OpenClaw-Projects\start-projets.bat` **ou** `powershell -File "D:\OpenClaw-Projects\dashboard-projets.ps1"`