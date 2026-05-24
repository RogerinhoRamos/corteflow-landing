@echo off
cd /d D:\corteflow-landing

:: Ler token do arquivo secreto (nao vai pro GitHub)
if not exist ".token" (
    echo ERRO: Arquivo .token nao encontrado!
    echo Crie o arquivo D:\corteflow-landing\.token com seu token do GitHub
    pause
    exit /b 1
)
set /p TOKEN=<.token

git init 2>nul
git remote remove origin 2>nul
git remote add origin https://RogerinhoRamos:%TOKEN%@github.com/RogerinhoRamos/corteflow-landing.git

set /p MSG=Descricao da atualizacao: 
if "%MSG%"=="" set MSG=atualizacao landing

git add .
git commit -m "%MSG%"
git branch -M main
git push -u origin main --force

echo.
echo Pronto! GitHub Pages atualiza em 1 minuto.
echo https://rogerinhoramos.github.io/corteflow-landing
echo.
pause
