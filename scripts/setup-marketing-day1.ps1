# Script de setup marketing - Jour 1
# Automatisation des fondations marketing

Write-Host "=== SETUP MARKETING JOUR 1 ===" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

# 1. Vérification des projets
Write-Host "1. VERIFICATION PROJETS..." -ForegroundColor Yellow

$jurisscanPath = "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main"
$lyssPath = "D:\OpenClaw-Projects\mes-projets\lyss-main"

if (Test-Path $jurisscanPath) {
    Write-Host "   ✅ Jurisscan: Present" -ForegroundColor Green
} else {
    Write-Host "   ❌ Jurisscan: Absent" -ForegroundColor Red
}

if (Test-Path $lyssPath) {
    Write-Host "   ✅ Lyss: Present" -ForegroundColor Green
} else {
    Write-Host "   ❌ Lyss: Absent" -ForegroundColor Red
}

Write-Host ""

# 2. Checklist outils à configurer
Write-Host "2. OUTILS MARKETING A CONFIGURER:" -ForegroundColor Yellow

$tools = @(
    @{Name="Google Analytics 4"; URL="https://analytics.google.com"; Status="A faire"},
    @{Name="Google Search Console"; URL="https://search.google.com"; Status="A faire"},
    @{Name="Canva (design)"; URL="https://canva.com"; Status="A faire"},
    @{Name="Buffer (social)"; URL="https://buffer.com"; Status="A faire"},
    @{Name="Mailchimp (email)"; URL="https://mailchimp.com"; Status="A faire"}
)

foreach ($tool in $tools) {
    Write-Host "   • $($tool.Name) - $($tool.Status)"
    Write-Host "     URL: $($tool.URL)" -ForegroundColor Gray
}

Write-Host ""

# 3. Assets à créer
Write-Host "3. ASSETS A CREER (Jour 1-3):" -ForegroundColor Yellow

$assets = @(
    "Logo (3 versions: grand, moyen, petit)",
    "Banniere LinkedIn (1584x396px)",
    "Banniere Twitter (1500x500px)",
    "Banniere Facebook (820x312px)",
    "Favicon (32x32px, 64x64px)",
    "Email signature",
    "Presentation deck (pitch)",
    "Press kit (media kit)"
)

foreach ($asset in $assets) {
    Write-Host "   • $asset"
}

Write-Host ""

# 4. Contenu à produire
Write-Host "4. CONTENU JOUR 1-3:" -ForegroundColor Yellow

$content = @(
    "Landing page Jurisscan (version 1)",
    "Landing page Lyss (version 1)", 
    "Email welcome sequence (3 emails)",
    "Social media posts (5 par projet)",
    "Blog articles outlines (3 par projet)"
)

foreach ($item in $content) {
    Write-Host "   • $item"
}

Write-Host ""

# 5. Prochaines étapes
Write-Host "5. PROCHAINES ETAPES:" -ForegroundColor Green

$nextSteps = @(
    "Configurer Google Analytics (aujourd'hui)",
    "Creer assets design base (aujourd'hui)",
    "Rediger landing pages (demain)",
    "Setup email marketing (demain)",
    "Lancer reseaux sociaux (jour 3)"
)

foreach ($step in $nextSteps) {
    Write-Host "   → $step"
}

Write-Host ""
Write-Host "=== RECOMMANDATIONS ===" -ForegroundColor Cyan

Write-Host "1. PRIORITE URGENTE:" -ForegroundColor Red
Write-Host "   • Configurer tracking analytics" -ForegroundColor Yellow
Write-Host "   • Sans tracking, impossible de mesurer ROI" -ForegroundColor Yellow

Write-Host ""
Write-Host "2. PRIORITE HAUTE:" -ForegroundColor Yellow
Write-Host "   • Assets design de base" -ForegroundColor Yellow
Write-Host "   • Landing pages version 1" -ForegroundColor Yellow

Write-Host ""
Write-Host "3. AUTOMATISATION:" -ForegroundColor Green
Write-Host "   • Utiliser templates existants" -ForegroundColor Gray
Write-Host "   • Reutiliser contenu entre projets" -ForegroundColor Gray
Write-Host "   • Planifier en batch" -ForegroundColor Gray

Write-Host ""
Write-Host "=== TEMPS ESTIMÉ ===" -ForegroundColor Cyan

$timeEstimates = @{
    "Setup analytics" = "2 heures"
    "Design assets" = "4 heures" 
    "Landing pages" = "6 heures"
    "Email setup" = "3 heures"
    "Social setup" = "2 heures"
}

Write-Host "Total estimé Jours 1-3: 17 heures" -ForegroundColor Yellow
Write-Host "Recommandation: 2 personnes × 2 jours" -ForegroundColor Green

Write-Host ""
Write-Host "🚀 LANCEMENT EFFECTUÉ LE $(Get-Date -Format 'dd/MM/yyyy HH:mm')" -ForegroundColor Cyan