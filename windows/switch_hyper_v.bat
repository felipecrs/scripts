@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

bcdedit /set hypervisorlaunchtype off REM or `auto` to turn on
pause
