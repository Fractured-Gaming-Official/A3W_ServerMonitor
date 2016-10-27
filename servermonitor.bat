:: After editing this file, use the exe converter and convert it to a .exe file.
@echo off
:arma
:: replace arma3server.exe with your server .exe name
tasklist /fi "imagename eq arma3server.exe" /fi "status eq running" |find  /i "arma3server.exe"  >nul && ( 
echo ------------------------------------------------
echo Server is running will continue monitoring
timeout 30
goto arma
) || ( 
echo ------------------------------------------------
echo Server is not running, will restart now
:: Path to the restart.bat you edited
start "Server" "C:\Games\Arma3\A3Master\restart.bat"
echo Server startup initiated!
exit
)
::bec
:: shouldn't have to rename this unless BEC.exe is renamed, if so replace bec.exe with proper name
::tasklist /fi "imagename eq bec.exe" /fi "status eq running" |find  /i "bec.exe"  >nul && ( 
::echo ------------------------------------------------
::echo Server BEC is running will continue monitoring
::timeout 30
::goto arma
::) || ( 
::echo ------------------------------------------------
::echo Server BEC is not running, will restart now
:: Path to BEC Folder
::cd C:\Games\Arma3\A3Master\BEC
:: Path to BEC.exe with params
::start "Server BEC" "C:\Games\Arma3\A3Master\BEC\bec.exe" -f Config.cfg --dsc
::echo Server BEC startup initiated!
::timeout 30
::goto arma
::)
