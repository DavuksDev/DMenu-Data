@echo off

REM Находим процесс Gorilla Tag.exe
for /f "tokens=2 delims=," %%a in ('tasklist /FI "IMAGENAME eq Gorilla Tag.exe" /FO CSV /NH') do (
    set PID=%%a
)

if not defined PID (
    echo Process Gorilla Tag.exe not found.
    exit /b
)

REM Находим путь к исполняемому файлу процесса
for /f "tokens=2 delims==" %%a in ('wmic process where "ProcessId=%PID%" get ExecutablePath /value') do (
    set EXEPATH=%%a
)

REM Переходим в директорию игры
cd /d "%EXEPATH%\.."

REM Удаляем плагин
del /f /q "BepInEx\plugins\utgload.dll"

REM Завершаем процесс Gorilla Tag.exe
taskkill /PID %PID%
