@echo off
cd /d C:\Users\LukeRichardson\Projects\portfolio-repos\recording-tutorial
if not exist .git git init
git branch -M main
git add -A
git commit -m "Add Recording Tutorial Storyline Web publish for GitHub Pages."
gh repo view LucasRichardson-stack/recording-tutorial >nul 2>&1
if errorlevel 1 (
  gh repo create LucasRichardson-stack/recording-tutorial --public --source=. --remote=origin --push --description "Interactive Storyline tutorial for saving and submitting customer recordings"
) else (
  git remote remove origin 2>nul
  git remote add origin https://github.com/LucasRichardson-stack/recording-tutorial.git
  git push -u origin main
)
gh api -X PUT repos/LucasRichardson-stack/recording-tutorial/pages -f build_type=legacy -f source[branch]=main -f source[path]=/
git status
