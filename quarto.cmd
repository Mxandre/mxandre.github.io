@echo off
rem AppData\Local has the Windows "Encrypted" attribute; Quarto cache files created there
rem cannot be copied into the project on Windows Home. Keep the cache elsewhere.
set "LOCALAPPDATA=%USERPROFILE%\.quarto-appdata"
rem Use the 8.3 short path so the space in "Program Files" never splits the command
for %%I in ("C:\Program Files\Quarto\bin\quarto.exe") do set "QUARTO_EXE=%%~sI"
"%QUARTO_EXE%" %*
