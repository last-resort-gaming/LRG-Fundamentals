@echo off

echo === Compiling documentation ===
echo.

mkdir ..\docs > nul 2> nul

"Natural Docs\NaturalDocs.exe" -p "lrg-fundamentals" -i "..\." -xi "..\tools\." -o HTML "..\docs\." -r
pause