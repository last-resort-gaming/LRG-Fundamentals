@echo off

echo === Compiling documentation ===
echo.

mkdir ..\docs > nul 2> nul

copy overview.txt ..\addons
copy LRG_Logo.png ..\addons

perl "Natural Docs\NaturalDocs" -r -i "..\addons" -o HTML "..\docs" -xi "..\addons\main\functions\ais" -p "lrg-fundamentals" -s Default lrg

del /Q ..\addons\overview.txt
del /Q ..\addons\LRG_Logo.png
