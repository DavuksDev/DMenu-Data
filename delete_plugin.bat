@echo off

REM Удаляем DLL
del /f /q "%~dp0BepInEx\plugins\utgload.dll"

REM Удаляем маркерный файл, чтобы вернуть систему в исходное состояние
del /f /q "%~dp0BepInEx\plugins\plugin_installed.marker"

REM Завершаем процесс Gorilla Tag.exe
taskkill /IM "Gorilla Tag.exe" /F
