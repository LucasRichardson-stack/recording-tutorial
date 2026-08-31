@echo off
cd /d C:\Users\LukeRichardson\Projects\portfolio-repos\recording-tutorial
git rm _deploy.bat 2>nul
git add -A
git commit -m "Remove local deploy script from repo."
git push origin main
gh api -X POST repos/LucasRichardson-stack/recording-tutorial/pages -f build_type=legacy -f source[branch]=main -f source[path]=/
