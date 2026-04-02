# 📊 GUIDE : CONFIGURATION GOOGLE ANALYTICS 4
## Pour Jurisscan et Lyss - Jour 1 Marketing

## 🎯 OBJECTIF
Configurer le tracking analytics pour mesurer les performances des 2 projets

## ⏱️ TEMPS ESTIMÉ : 1-2 heures

## 📋 PRÉREQUIS
- Compte Google (Gmail)
- Accès aux sites/projets
- 30 minutes de concentration

## 🚀 ÉTAPES

### ÉTAPE 1 : CRÉER COMPTE GOOGLE ANALYTICS

#### 1.1 Aller sur Google Analytics
```
https://analytics.google.com
```

#### 1.2 Cliquer "Commencer"
- Utiliser ton compte Google principal

#### 1.3 Créer un compte
```
Nom du compte : "Blackdorvelus Star"
→ Ce compte contiendra les 2 propriétés (Jurisscan + Lyss)
```

### ÉTAPE 2 : CRÉER PROPRIÉTÉ JURISSCAN

#### 2.1 Dans le compte, cliquer "Créer une propriété"
```
Nom de la propriété : "Jurisscan"
Fuseau horaire : America/Toronto
Devise : CAD (Dollar canadien)
```

#### 2.2 Informations entreprise
```
Industrie : Technology → Software
Taille de l'entreprise : Small (1-10)
```

#### 2.3 Objectifs business
Cocher :
- [ ] Générer des leads
- [ ] Augmenter les conversions en ligne
- [ ] Obtenir des informations sur le comportement des utilisateurs

### ÉTAPE 3 : CRÉER PROPRIÉTÉ LYSS

#### 3.1 Répéter Étape 2 pour Lyss
```
Nom de la propriété : "Lyss"
Mêmes paramètres que Jurisscan
```

### ÉTAPE 4 : CONFIGURER LES FLUX DE DONNÉES

#### 4.1 Pour Jurisscan
```
Type de plateforme : Web
URL du site Web : https://jurisscan.com (ou localhost:3000 pour dev)
Nom du flux : "Jurisscan Web"
```

#### 4.2 Pour Lyss
```
Type de plateforme : Web  
URL du site Web : https://lyss.app (ou localhost:8080 pour dev)
Nom du flux : "Lyss Web"
```

### ÉTAPE 5 : INSTALLER LE CODE DE SUIVI

#### 5.1 Récupérer le code GA4
Pour chaque propriété :
1. Aller dans "Administration" → "Flux de données"
2. Cliquer sur le flux créé
3. Cliquer "Tagging" → "Balise Google"
4. Copier le code (commence par `<!-- Google tag (gtag.js) -->`)

#### 5.2 Installation pour développement local

##### Pour Jurisscan (React/Next.js) :
```javascript
// Dans _app.js ou équivalent
import Script from 'next/script'

function MyApp({ Component, pageProps }) {
  return (
    <>
      <Script
        strategy="afterInteractive"
        src={`https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX`}
      />
      <Script
        id="google-analytics"
        strategy="afterInteractive"
        dangerouslySetInnerHTML={{
          __html: `
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'G-XXXXXXXXXX');
          `,
        }}
      />
      <Component {...pageProps} />
    </>
  )
}
```

##### Pour Lyss (Vite/React) :
```html
<!-- Dans index.html -->
<head>
  <!-- Google tag (gtag.js) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-XXXXXXXXXX');
  </script>
</head>
```

### ÉTAPE 6 : CONFIGURER LES ÉVÉNEMENTS

#### 6.1 Événements recommandés (pour les 2 projets)

##### Événements automatiques (déjà trackés) :
- `page_view`
- `first_visit`
- `session_start`

##### Événements à configurer manuellement :

**Conversions :**
```
sign_up (Inscription)
- Trigger: Formulaire d'inscription soumis

start_trial (Démarrage essai)
- Trigger: Clic bouton "Start Free Trial"

contact_sales (Contact commercial)
- Trigger: Clic bouton "Contact Sales"

download_resource (Téléchargement ressource)
- Trigger: Téléchargement PDF/guide
```

**Engagement :**
```
blog_view (Lecture article)
- Trigger: Temps sur page > 30 secondes

video_view (Visionnage vidéo)
- Trigger: Lecture vidéo démarrée

social_share (Partage social)
- Trigger: Clic boutons share
```

### ÉTAPE 7 : CONFIGURER GOOGLE TAG MANAGER (OPTIONNEL MAIS RECOMMANDÉ)

#### 7.1 Créer compte Tag Manager
```
https://tagmanager.google.com
```

#### 7.2 Créer conteneur pour chaque projet
```
Jurisscan Container
Lyss Container
```

#### 7.3 Installer GTM sur les sites
Même méthode que GA4, mais avec le code GTM

### ÉTAPE 8 : VÉRIFICATION

#### 8.1 Vérifier l'installation
1. Aller sur ton site
2. Ouvrir DevTools (F12)
3. Aller dans "Network"
4. Vérifier les requêtes vers `www.googletagmanager.com`

#### 8.2 Vérifier en temps réel
1. Dans GA4, aller dans "Rapports" → "Temps réel"
2. Visiter ton site
3. Vérifier que tu apparais dans le dashboard

### ÉTAPE 9 : CONFIGURATIONS AVANCÉES

#### 9.1 Liens avec Google Search Console
1. Dans GA4, aller dans "Administration"
2. "Liens de produits" → "Search Console"
3. Lier ton compte Search Console

#### 9.2 Configurer les audiences
Créer des audiences pour :
- Nouveaux visiteurs
- Utilisateurs engagés (session > 5 min)
- Abandon panier (si e-commerce)
- Leads qualifiés

#### 9.3 Configurer les conversions
Marquer les événements importants comme conversions :
1. `sign_up` → Conversion
2. `start_trial` → Conversion
3. `contact_sales` → Conversion

## 🛠️ DÉPANNAGE

### Problème : Code non détecté
**Solution :**
1. Vérifier que le code est bien dans le `<head>`
2. Vérifier qu'il n'y a pas d'erreurs dans la console
3. Attendre 24-48h pour les données initiales

### Problème : Données incomplètes
**Solution :**
1. Vérifier les filtres IP (exclure ton IP si besoin)
2. Vérifier la configuration des événements
3. Tester avec Google Tag Assistant

### Problème : Deux sites, un compte
**Solution :**
C'est correct ! Un compte GA peut avoir plusieurs propriétés.

## 📊 TABLEAU DE BORD RECOMMANDÉ

### Dashboard 1 : Vue d'ensemble
```
- Utilisateurs (7 jours)
- Sessions
- Taux de rebond
- Pages/session
- Durée moyenne session
```

### Dashboard 2 : Acquisition
```
- Source/medium
- Campagnes
- Canaux
- Pages de destination
```

### Dashboard 3 : Engagement
```
- Pages les plus vues
- Événements
- Conversions
- Audience active
```

### Dashboard 4 : Conversions
```
- Taux de conversion
- Valeur conversion
- Funnel visualisation
- ROI par canal
```

## 🔄 MAINTENANCE RÉGULIÈRE

### Quotidien :
- Vérifier données temps réel
- Vérifier erreurs tracking

### Hebdomadaire :
- Analyser rapports performance
- Ajuster audiences
- Optimiser conversions

### Mensuel :
- Revue complète performance
- Ajustement stratégie
- Planification next month

## 📈 MÉTRICS CLÉS À SUIVRE

### Pour Jurisscan :
```
- Inscriptions essai gratuit
- Demos demandées
- Téléchargements ressources
- Engagement contenu juridique
```

### Pour Lyss :
```
- Inscriptions essai gratuit
- Tâches automatisées
- Engagement templates
- Partages sociaux
```

## 🎯 SUCCÈS CRITÈRE

### Jours 1-7 :
- Tracking fonctionnel sur les 2 sites
- Événements de base configurés
- Premières données collectées
- Dashboard de base opérationnel

### Jours 8-30 :
- Funnel conversion configuré
- Audiences personnalisées
- A/B testing setup
- Reporting automatisé

## 🔗 RESSOURCES

### Documentation officielle :
- https://support.google.com/analytics
- https://developers.google.com/analytics

### Outils de test :
- Google Tag Assistant (extension Chrome)
- GA Debugger (extension Chrome)
- Real-time reports (dans GA4)

### Templates :
- Dashboard templates dans GA4
- Event tracking templates
- Audience templates

---

**✅ ACTION : Configurer GA4 maintenant pour pouvoir mesurer les résultats du marketing !**

**Temps estimé : 1-2 heures**
**Priorité : URGENTE**