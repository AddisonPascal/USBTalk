@echo off
mode 1000
title USB Talk
if not exist talkdata goto setup
if not exist "%~dp0talkdata\msgs.txt" goto setup
goto menu

:setup
if not exist talkdata md talkdata
(
@echo off
echo Conversation started on %time%, %date%. 
echo. 
)>"%~dp0talkdata\msgs.txt"
goto menu

:menu
cls
echo Menu for USBTalk.
echo Remember, this program, the "talkdata" folder, and "talkdata.dat" all need to be in the main directory of a drive. 
echo. 
echo 1= Clear all messages [start new conversation]
if not exist "C:\Users\%username%\Desktop\USBTalk.bat" (
echo 2= ADD TO DESKTOP [Necessary step to use USBTalk]
)
if exist "C:\Users\%username%\Desktop\USBTalk.bat" (
echo You've got USBTalk on your desktop! Open it to message!
)
set /p userInput= "--> "
if "%userInput%"=="1" goto clearData
if "%userInput%"=="2" goto install
goto menu

:clearData
(
@echo off
echo Conversation started on %time%, %date%. 
echo. 
)>"%~dp0talkdata\msgs.txt"
cls
echo All done. 
pause
goto menu

:install
copy "%~dp0talkdata.dat" "C:\Users\%username%\Desktop\"
ren "C:\Users\%username%\Desktop\talkdata.dat" "USBTalk.bat"
cls
echo All done. 
pause
goto menu