@echo off
echo ============================================
echo 🚀 LANCEUR PROJETS PARALLÈLES - OPENCLAW
echo ============================================
echo.
echo Ce script démarre Jurisscan et Lyss en parallèle
echo avec monitoring automatique.
echo.
echo Options :
echo   1. Démarrer avec dashboard
echo   2. Démarrer en arrière-plan
echo   3. Dashboard seulement
echo   4. Quitter
echo.
choice /c 1234 /n /m "Votre choix : "

if errorlevel 4 goto :exit
if errorlevel 3 goto :dashboard
if errorlevel 2 goto :background
if errorlevel 1 goto :dashboard_start

:dashboard_start
echo.
echo 🚀 Démarrage des projets avec dashboard...
powershell -ExecutionPolicy Bypass -File "D:\OpenClaw-Projects\dashboard-projets.ps1" -AutoStart
goto :exit

:background
echo.
echo ⚙️ Démarrage en arrière-plan...
start powershell -NoExit -ExecutionPolicy Bypass -Command "cd 'D:\OpenClaw-Projects\mes-projets\jurisscan-7393c5ef-main' && npm run dev"
timeout /t 3 /nobreak >nul
start powershell -NoExit -ExecutionPolicy Bypass -Command "cd 'D:\OpenClaw-Projects\mes-projets\lyss' && npm run dev"
echo.
echo ✅ Projets démarrés en arrière-plan !
echo.
echo Pour surveiller : powershell -File "D:\OpenClaw-Projects\dashboard-projets.ps1"
goto :exit

:dashboard
echo.
echo 📊 Lancement du dashboard...
powershell -ExecutionPolicy Bypass -File "D:\OpenClaw-Projects\dashboard-projets.ps1"
goto :exit

:exit
echo.
echo ============================================
echo 👋 Au revoir !
echo ============================================
pause