# 📋 TEST WORKFLOWS & ACTIONS - Jurisscan & Lyss
# Date: $(Get-Date -Format "yyyy-MM-dd HH:mm")

Write-Host "=== TEST WORKFLOWS & ACTIONS ===" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

# 1. VÉRIFICATION DES WORKFLOWS JURISSCAN
Write-Host "1. WORKFLOWS JURISSCAN" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green

$jurisscanPath = "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main\.github\workflows"
if (Test-Path $jurisscanPath) {
    $workflows = Get-ChildItem $jurisscanPath -Filter *.yml
    Write-Host "✅ $($workflows.Count) workflows trouvés :" -ForegroundColor Green
    
    foreach ($wf in $workflows) {
        Write-Host "   • $($wf.Name)" -ForegroundColor White
        
        # Lire le contenu pour voir les triggers
        try {
            $content = Get-Content $wf.FullName -First 10 -ErrorAction Stop
            $triggers = $content | Where-Object { $_ -match "on:" -or $_ -match "push:" -or $_ -match "schedule:" }
            
            if ($triggers) {
                Write-Host "     Déclencheurs :" -ForegroundColor Gray
                foreach ($trigger in $triggers) {
                    Write-Host "       $trigger" -ForegroundColor DarkGray
                }
            }
        } catch {
            Write-Host "     (erreur lecture)" -ForegroundColor Red
        }
    }
    
    # Vérifier les agents Relevance AI
    $relevancePath = "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main\.relevance"
    if (Test-Path $relevancePath) {
        $agents = Get-ChildItem $relevancePath -Filter *.json
        Write-Host "`n✅ $($agents.Count) agents Relevance AI configurés :" -ForegroundColor Green
        foreach ($agent in $agents) {
            Write-Host "   • $($agent.Name)" -ForegroundColor White
        }
    }
    
    # Vérifier les agents Twin.so
    $twinPath = "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main\.twin"
    if (Test-Path $twinPath) {
        $twinAgents = Get-ChildItem $twinPath -Filter *.yml
        Write-Host "`n✅ $($twinAgents.Count) agents Twin.so configurés :" -ForegroundColor Green
        foreach ($agent in $twinAgents) {
            Write-Host "   • $($agent.Name)" -ForegroundColor White
        }
    }
} else {
    Write-Host "❌ Aucun dossier workflows trouvé pour Jurisscan" -ForegroundColor Red
}

Write-Host ""

# 2. VÉRIFICATION DES WORKFLOWS LYSS
Write-Host "2. WORKFLOWS LYSS" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green

$lyssPath = "D:\OpenClaw-Projects\mes-projets\lyss-main\.github\workflows"
if (Test-Path $lyssPath) {
    $workflows = Get-ChildItem $lyssPath -Filter *.yml
    Write-Host "✅ $($workflows.Count) workflows trouvés :" -ForegroundColor Green
    foreach ($wf in $workflows) {
        Write-Host "   • $($wf.Name)" -ForegroundColor White
    }
} else {
    Write-Host "ℹ️  Aucun workflow GitHub trouvé pour Lyss" -ForegroundColor Yellow
    Write-Host "   (C'est normal pour un projet en développement)" -ForegroundColor DarkYellow
}

Write-Host ""

# 3. VÉRIFICATION DES DERNIERS COMMITS
Write-Host "3. DERNIERS COMMITS" -ForegroundColor Green
Write-Host "====================" -ForegroundColor Green

Write-Host "Jurisscan (5 derniers commits) :" -ForegroundColor White
try {
    cd "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main"
    git log --oneline -5
} catch {
    Write-Host "   (Erreur git)" -ForegroundColor Red
}

Write-Host "`nLyss (5 derniers commits) :" -ForegroundColor White
try {
    cd "D:\OpenClaw-Projects\mes-projets\lyss-main"
    git log --oneline -5 2>$null
} catch {
    Write-Host "   (Pas encore de commits ou erreur git)" -ForegroundColor Gray
}

Write-Host ""

# 4. VÉRIFICATION DES SECRETS GITHUB (simulation)
Write-Host "4. SECRETS GITHUB REQUIS" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green

Write-Host "Secrets nécessaires pour Jurisscan workflows :" -ForegroundColor White
Write-Host "   • RELEVANCE_API_KEY" -ForegroundColor Cyan
Write-Host "   • RELEVANCE_PROJECT_ID" -ForegroundColor Cyan
Write-Host "   • RELEVANCE_REGION" -ForegroundColor Cyan
Write-Host "   • VITE_SUPABASE_URL" -ForegroundColor Cyan
Write-Host "   • VITE_SUPABASE_PUBLISHABLE_KEY" -ForegroundColor Cyan
Write-Host "   • TWIN_API_KEY" -ForegroundColor Cyan
Write-Host "   • GITEA_TOKEN" -ForegroundColor Cyan
Write-Host "   • CODEBERG_TOKEN" -ForegroundColor Cyan

Write-Host "`n⚠️  Ces secrets doivent être configurés dans :" -ForegroundColor Yellow
Write-Host "   GitHub → Repository → Settings → Secrets and variables → Actions" -ForegroundColor White

Write-Host ""

# 5. TEST DES WORKFLOWS LOCAUX (simulation)
Write-Host "5. TESTS LOCAUX DES WORKFLOWS" -ForegroundColor Green
Write-Host "==============================" -ForegroundColor Green

Write-Host "Tests pouvant être exécutés localement :" -ForegroundColor White

# Test build Jurisscan
Write-Host "`n🔨 Test build Jurisscan :" -ForegroundColor Cyan
cd "D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main"
if (Test-Path "package.json") {
    try {
        $package = Get-Content "package.json" | ConvertFrom-Json
        Write-Host "   • Scripts disponibles :" -ForegroundColor White
        if ($package.scripts) {
            foreach ($script in $package.scripts.PSObject.Properties) {
                Write-Host "     - $($script.Name): $($script.Value)" -ForegroundColor Gray
            }
        }
    } catch {
        Write-Host "   (Erreur lecture package.json)" -ForegroundColor Red
    }
}

# Test build Lyss
Write-Host "`n🔨 Test build Lyss :" -ForegroundColor Cyan
cd "D:\OpenClaw-Projects\mes-projets\lyss-main"
if (Test-Path "package.json") {
    try {
        $package = Get-Content "package.json" | ConvertFrom-Json
        Write-Host "   • Scripts disponibles :" -ForegroundColor White
        if ($package.scripts) {
            foreach ($script in $package.scripts.PSObject.Properties) {
                Write-Host "     - $($script.Name): $($script.Value)" -ForegroundColor Gray
            }
        }
    } catch {
        Write-Host "   (Erreur lecture package.json)" -ForegroundColor Red
    }
}

Write-Host ""

# 6. RECOMMANDATIONS
Write-Host "6. RECOMMANDATIONS" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Green

Write-Host "✅ Actions à faire maintenant :" -ForegroundColor White
Write-Host "   1. Configurer les secrets GitHub pour Jurisscan" -ForegroundColor Cyan
Write-Host "   2. Tester manuellement le workflow 'build.yml'" -ForegroundColor Cyan
Write-Host "   3. Vérifier que Lovable détecte les changements" -ForegroundColor Cyan
Write-Host "   4. Publier sur Lovable si bouton actif" -ForegroundColor Cyan

Write-Host "`n📅 Actions programmées :" -ForegroundColor White
Write-Host "   • Twin.so agents sync : Toutes les 12 heures (cron: '0 */12 * * *')" -ForegroundColor Gray
Write-Host "   • Relevance AI setup : Sur push vers main" -ForegroundColor Gray
Write-Host "   • CI Tests : Sur push et pull requests" -ForegroundColor Gray

Write-Host "`n🔧 Prochaines améliorations :" -ForegroundColor White
Write-Host "   1. Ajouter des workflows pour Lyss" -ForegroundColor Cyan
Write-Host "   2. Configurer des tests automatisés" -ForegroundColor Cyan
Write-Host "   3. Ajouter un déploiement automatique" -ForegroundColor Cyan
Write-Host "   4. Configurer des notifications" -ForegroundColor Cyan

Write-Host ""

# 7. COMMANDES DE TEST
Write-Host "7. COMMANDES DE TEST À EXÉCUTER" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green

Write-Host "Pour tester manuellement :" -ForegroundColor White
Write-Host "`n# Test build Jurisscan :" -ForegroundColor Cyan
Write-Host "cd 'D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main'" -ForegroundColor Gray
Write-Host "bun install" -ForegroundColor Gray
Write-Host "bun run build" -ForegroundColor Gray

Write-Host "`n# Test build Lyss :" -ForegroundColor Cyan
Write-Host "cd 'D:\OpenClaw-Projects\mes-projets\lyss-main'" -ForegroundColor Gray
Write-Host "npm install" -ForegroundColor Gray
Write-Host "npm run build" -ForegroundColor Gray

Write-Host "`n# Vérifier GitHub Actions :" -ForegroundColor Cyan
Write-Host "Visiter : https://github.com/blackdorvelus-star/jurisscan-7393c5ef/actions" -ForegroundColor Gray
Write-Host "Visiter : https://github.com/blackdorvelus-star/lyss/actions" -ForegroundColor Gray

Write-Host "`n# Vérifier Lovable :" -ForegroundColor Cyan
Write-Host "1. Rafraîchir la page Lovable" -ForegroundColor Gray
Write-Host "2. Vérifier si 'Publish' est actif" -ForegroundColor Gray
Write-Host "3. Cliquer sur 'Publish' si disponible" -ForegroundColor Gray

Write-Host ""
Write-Host "=== TEST TERMINÉ ===" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date)" -ForegroundColor Yellow