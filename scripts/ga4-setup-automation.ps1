# Script d'automatisation setup Google Analytics 4
# Pour Jurisscan et Lyss

Write-Host "=== AUTOMATISATION SETUP GOOGLE ANALYTICS 4 ===" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

# 1. Instructions étape par étape
Write-Host "1. ÉTAPES MANUELLES (à faire maintenant):" -ForegroundColor Green

Write-Host ""
Write-Host "ÉTAPE 1 : Aller sur Google Analytics" -ForegroundColor Yellow
Write-Host "   URL: https://analytics.google.com" -ForegroundColor White
Write-Host "   Compte Google: Utilise ton compte principal" -ForegroundColor Gray

Write-Host ""
Write-Host "ÉTAPE 2 : Créer le compte principal" -ForegroundColor Yellow
Write-Host "   Nom du compte: 'Blackdorvelus Star'" -ForegroundColor White
Write-Host "   Ce compte contiendra les 2 propriétés" -ForegroundColor Gray

Write-Host ""
Write-Host "ÉTAPE 3 : Créer propriété JURISSCAN" -ForegroundColor Yellow
Write-Host "   Nom: 'Jurisscan'" -ForegroundColor White
Write-Host "   Fuseau: America/Toronto" -ForegroundColor Gray
Write-Host "   Devise: CAD" -ForegroundColor Gray
Write-Host "   Industrie: Technology → Software" -ForegroundColor Gray
Write-Host "   Taille: Small (1-10)" -ForegroundColor Gray

Write-Host ""
Write-Host "ÉTAPE 4 : Créer propriété LYSS" -ForegroundColor Yellow
Write-Host "   Nom: 'Lyss'" -ForegroundColor White
Write-Host "   Mêmes paramètres que Jurisscan" -ForegroundColor Gray

Write-Host ""
Write-Host "ÉTAPE 5 : Configurer flux de données" -ForegroundColor Yellow
Write-Host "   Pour chaque propriété:" -ForegroundColor White
Write-Host "   1. Type: Web" -ForegroundColor Gray
Write-Host "   2. URL:" -ForegroundColor Gray
Write-Host "      - Jurisscan: https://jurisscan.com (ou localhost:3000)" -ForegroundColor Gray
Write-Host "      - Lyss: https://lyss.app (ou localhost:8080)" -ForegroundColor Gray
Write-Host "   3. Nom flux: '[Projet] Web'" -ForegroundColor Gray

Write-Host ""
Write-Host "ÉTAPE 6 : Récupérer codes tracking" -ForegroundColor Yellow
Write-Host "   Pour chaque propriété, copier:" -ForegroundColor White
Write-Host "   - Measurement ID (commence par G-)" -ForegroundColor Gray
Write-Host "   - Code gtag.js complet" -ForegroundColor Gray

# 2. Template pour les codes tracking
Write-Host ""
Write-Host "2. TEMPLATES CODE TRACKING:" -ForegroundColor Green

Write-Host ""
Write-Host "Pour JURISSCAN (React/Next.js):" -ForegroundColor Yellow
Write-Host @'
// Dans _app.js ou équivalent
import Script from 'next/script'

function MyApp({ Component, pageProps }) {
  return (
    <>
      <Script
        strategy="afterInteractive"
        src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"
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
'@ -ForegroundColor Gray

Write-Host ""
Write-Host "Pour LYSS (Vite/React):" -ForegroundColor Yellow
Write-Host @'
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
'@ -ForegroundColor Gray

# 3. Événements à configurer
Write-Host ""
Write-Host "3. ÉVÉNEMENTS À CONFIGURER:" -ForegroundColor Green

$events = @(
    @{Name="sign_up"; Description="Inscription"; Trigger="Formulaire soumis"},
    @{Name="start_trial"; Description="Démarrage essai"; Trigger="Bouton cliqué"},
    @{Name="contact_sales"; Description="Contact commercial"; Trigger="Bouton cliqué"},
    @{Name="download_resource"; Description="Téléchargement"; Trigger="Fichier téléchargé"},
    @{Name="blog_view"; Description="Lecture article"; Trigger="Temps > 30s"},
    @{Name="video_view"; Description="Visionnage vidéo"; Trigger="Vidéo démarrée"}
)

Write-Host "   Configurer ces événements dans GA4:" -ForegroundColor Yellow
foreach ($event in $events) {
    Write-Host "   • $($event.Name) - $($event.Description)" -ForegroundColor White
    Write-Host "     Trigger: $($event.Trigger)" -ForegroundColor Gray
}

# 4. Vérification
Write-Host ""
Write-Host "4. VÉRIFICATION:" -ForegroundColor Green

Write-Host "   Après installation:" -ForegroundColor Yellow
Write-Host "   1. Aller sur ton site" -ForegroundColor White
Write-Host "   2. Ouvrir DevTools (F12)" -ForegroundColor Gray
Write-Host "   3. Vérifier requêtes vers googletagmanager.com" -ForegroundColor Gray
Write-Host "   4. Vérifier GA4 → Temps réel" -ForegroundColor Gray

# 5. Fichiers à créer
Write-Host ""
Write-Host "5. FICHIERS À CRÉER:" -ForegroundColor Green

Write-Host "   Dans chaque projet, créer:" -ForegroundColor Yellow
Write-Host "   - /lib/gtag.js (code GA4)" -ForegroundColor White
Write-Host "   - /components/GoogleAnalytics.jsx (composant React)" -ForegroundColor White
Write-Host "   - .env.local (Measurement ID)" -ForegroundColor White

# 6. Template .env.local
Write-Host ""
Write-Host "6. TEMPLATE .env.local:" -ForegroundColor Green

Write-Host "   JURISSCAN:" -ForegroundColor Yellow
Write-Host "   NEXT_PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX" -ForegroundColor Gray

Write-Host ""
Write-Host "   LYSS:" -ForegroundColor Yellow
Write-Host "   VITE_GA_MEASUREMENT_ID=G-XXXXXXXXXX" -ForegroundColor Gray

# 7. Dashboard recommandé
Write-Host ""
Write-Host "7. DASHBOARD RECOMMANDÉ:" -ForegroundColor Green

Write-Host "   Créer ces rapports dans GA4:" -ForegroundColor Yellow
$reports = @(
    "Vue d'ensemble (Utilisateurs, Sessions, Bounce Rate)",
    "Acquisition (Source/Medium, Canaux)",
    "Engagement (Pages, Événements)",
    "Conversions (Funnel, Taux conversion)",
    "Audience (Démographie, Intérêts)"
)

foreach ($report in $reports) {
    Write-Host "   • $report" -ForegroundColor White
}

# 8. Prochaines étapes
Write-Host ""
Write-Host "8. PROCHAINES ÉTAPES APRÈS GA4:" -ForegroundColor Green

$nextSteps = @(
    "Configurer Google Search Console",
    "Lier GA4 avec Search Console",
    "Configurer audiences personnalisées",
    "Marquer événements comme conversions",
    "Créer alertes (anomalies)"
)

Write-Host "   Une fois GA4 configuré:" -ForegroundColor Yellow
foreach ($step in $nextSteps) {
    Write-Host "   → $step" -ForegroundColor White
}

# 9. Temps estimé
Write-Host ""
Write-Host "9. TEMPS ESTIMÉ:" -ForegroundColor Green

Write-Host "   Setup initial GA4: 1-2 heures" -ForegroundColor Yellow
Write-Host "   Installation code: 30 minutes" -ForegroundColor Gray
Write-Host "   Configuration événements: 1 heure" -ForegroundColor Gray
Write-Host "   Testing & vérification: 30 minutes" -ForegroundColor Gray
Write-Host "   TOTAL: 3-4 heures" -ForegroundColor Yellow

Write-Host ""
Write-Host "=== ACTION REQUISE ===" -ForegroundColor Cyan
Write-Host "1. Aller sur https://analytics.google.com MAINTENANT" -ForegroundColor Red
Write-Host "2. Suivre les étapes ci-dessus" -ForegroundColor Red
Write-Host "3. Noter les Measurement IDs (G-XXXXXXXXXX)" -ForegroundColor Red
Write-Host "4. Installer le code sur les sites" -ForegroundColor Red

Write-Host ""
Write-Host "✅ Une fois fait, le tracking marketing sera opérationnel !" -ForegroundColor Green