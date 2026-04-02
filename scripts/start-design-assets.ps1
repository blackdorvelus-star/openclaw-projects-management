# Script pour démarrer les assets design
# Ouvre tous les guides et templates nécessaires

Write-Host "=== DÉMARRAGE ASSETS DESIGN ===" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

# 1. Instructions principales
Write-Host "1. ACTION IMMÉDIATE :" -ForegroundColor Green
Write-Host "   Aller sur Canva : https://canva.com" -ForegroundColor Red
Write-Host "   Temps estimé : 30 minutes pour setup" -ForegroundColor Yellow

Write-Host ""
Write-Host "2. ÉTAPES CANVA :" -ForegroundColor Green

$canvaSteps = @(
    "1. Créer compte (Google login)",
    "2. Activer essai gratuit Canva Pro",
    "3. Créer Brand 'Jurisscan'",
    "4. Créer Brand 'Lyss'",
    "5. Définir palettes couleurs",
    "6. Sélectionner polices",
    "7. Commencer avec les logos"
)

foreach ($step in $canvaSteps) {
    Write-Host "   $step" -ForegroundColor White
}

Write-Host ""
Write-Host "3. RESSOURCES DISPONIBLES :" -ForegroundColor Green

$resources = @(
    @{Name="Guide Canva Templates"; Path="templates\canva-templates-guide.md"; Description="Templates spécifiques"},
    @{Name="Design Assets Checklist"; Path="templates\design-assets-checklist.md"; Description="Checklist complète"},
    @{Name="Brand Colors"; Description="Palettes prédéfinies"}
)

foreach ($resource in $resources) {
    Write-Host "   • $($resource.Name)" -ForegroundColor White
    if ($resource.Path) {
        Write-Host "     Fichier: $($resource.Path)" -ForegroundColor Gray
    }
    Write-Host "     $($resource.Description)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "4. PALETTES COULEURS PRÉDÉFINIES :" -ForegroundColor Green

Write-Host ""
Write-Host "   JURISSCAN (Legal Tech) :" -ForegroundColor Blue
$jurisscanColors = @(
    "Primaire: #2563EB (Bleu Royal)",
    "Secondaire: #1E40AF (Bleu Marine)", 
    "Accent: #60A5FA (Bleu Clair)",
    "Texte: #1F2937 (Gris Foncé)",
    "Fond: #FFFFFF (Blanc)"
)

foreach ($color in $jurisscanColors) {
    Write-Host "     $color" -ForegroundColor Gray
}

Write-Host ""
Write-Host "   LYSS (Productivity) :" -ForegroundColor Green
$lyssColors = @(
    "Primaire: #10B981 (Émeraude)",
    "Secondaire: #059669 (Vert Forêt)",
    "Accent: #34D399 (Vert Menthe)",
    "Texte: #1F2937 (Gris Foncé)",
    "Fond: #FFFFFF (Blanc)"
)

foreach ($color in $lyssColors) {
    Write-Host "     $color" -ForegroundColor Gray
}

Write-Host ""
Write-Host "5. TYPOGRAPHIE PRÉDÉFINIE :" -ForegroundColor Green

Write-Host ""
Write-Host "   JURISSCAN :" -ForegroundColor Blue
Write-Host "     Titres: Inter (Bold)" -ForegroundColor Gray
Write-Host "     Corps: Open Sans (Regular)" -ForegroundColor Gray

Write-Host ""
Write-Host "   LYSS :" -ForegroundColor Green
Write-Host "     Titres: Poppins (Bold)" -ForegroundColor Gray
Write-Host "     Corps: Lato (Regular)" -ForegroundColor Gray

Write-Host ""
Write-Host "6. ASSETS PRIORITAIRES (aujourd'hui) :" -ForegroundColor Green

$priorityAssets = @(
    @{Project="Jurisscan"; Assets="Logo + LinkedIn Banner"; Time="45 min"},
    @{Project="Lyss"; Assets="Logo + LinkedIn Banner"; Time="45 min"},
    @{Project="Les deux"; Assets="5 posts LinkedIn chacun"; Time="60 min"}
)

Write-Host "   A faire aujourd'hui :" -ForegroundColor Yellow
foreach ($asset in $priorityAssets) {
    Write-Host "   • $($asset.Project): $($asset.Assets)" -ForegroundColor White
    Write-Host "     Temps: $($asset.Time)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "7. WORKFLOW RECOMMANDÉ :" -ForegroundColor Green

$workflow = @(
    "Phase 1 (30 min): Setup Canva + Brands",
    "Phase 2 (45 min): Logos Jurisscan & Lyss",
    "Phase 3 (45 min): Bannières LinkedIn",
    "Phase 4 (60 min): Posts sociaux (5 each)",
    "Phase 5 (30 min): Organisation + Export"
)

Write-Host "   Total: 3.5 heures" -ForegroundColor Yellow
foreach ($phase in $workflow) {
    Write-Host "   → $phase" -ForegroundColor White
}

Write-Host ""
Write-Host "8. LIENS DIRECTS :" -ForegroundColor Green

$links = @(
    @{Name="Canva"; URL="https://canva.com"},
    @{Name="Template Logos"; URL="https://canva.com/templates/search/modern-tech-logo/"},
    @{Name="Template LinkedIn"; URL="https://canva.com/templates/search/linkedin-banner-professional/"},
    @{Name="Template Posts"; URL="https://canva.com/templates/search/linkedin-post-modern/"}
)

foreach ($link in $links) {
    Write-Host "   • $($link.Name): $($link.URL)" -ForegroundColor White
}

Write-Host ""
Write-Host "9. CONSEILS RAPIDES :" -ForegroundColor Green

$tips = @(
    "Utiliser Canva Pro (essai gratuit)",
    "Magic Resize pour gagner du temps",
    "Sauvegarder dans Brand Kit",
    "Exporter en PNG haute qualité",
    "Organiser avec dossiers Canva"
)

foreach ($tip in $tips) {
    Write-Host "   💡 $tip" -ForegroundColor Gray
}

Write-Host ""
Write-Host "10. PROCHAINES ÉTAPES APRÈS DESIGN :" -ForegroundColor Green

$nextAfterDesign = @(
    "Configurer Google Analytics (si pas fait)",
    "Créer landing pages avec les nouveaux assets",
    "Setup email marketing templates",
    "Programmer posts sociaux dans Buffer",
    "Commencer contenu blog"
)

Write-Host "   Une fois assets créés :" -ForegroundColor Yellow
foreach ($step in $nextAfterDesign) {
    Write-Host "   → $step" -ForegroundColor White
}

Write-Host ""
Write-Host "=== DÉMARRAGE ===" -ForegroundColor Cyan
Write-Host "1. OUVRE CANVA : https://canva.com" -ForegroundColor Red -BackgroundColor White
Write-Host "2. SUIS LE GUIDE : templates\canva-templates-guide.md" -ForegroundColor Red -BackgroundColor White
Write-Host "3. COMMENCE PAR LES LOGOS" -ForegroundColor Red -BackgroundColor White

Write-Host ""
Write-Host "⏰ Temps total estimé : 3-4 heures" -ForegroundColor Yellow
Write-Host "🎯 Objectif : Tous assets de base pour demain" -ForegroundColor Green

Write-Host ""
Write-Host "🚀 BONNE CRÉATION !" -ForegroundColor Cyan