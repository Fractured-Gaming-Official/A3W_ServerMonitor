@echo off
:: rename all taskkill to proper exe file.
taskkill /f /im "arma3server.exe" /t
taskkill /f /im "arma3client.exe" /t 
taskkill /f /im "servermonitor.bat" /t
taskkill /f /im "servermonitor.exe" /t
:: Server Params (Path to exe, noPause, noSound, noSplash, filePatching, autoInit, Profile Name, Path to Profile,Path to config file, Path to cfg, Mods, Battleye Path, Map, Server Port)
start /wait /b C:\Games\Arma3\A3Master\arma3server.exe -noPause -noSound -nosplash -filePatching -autoInit -name=default -profiles=C:\Games\Arma3\A3Master\Profiles -config=C:\Games\Arma3\A3Master\CONFIG_server.cfg -cfg=C:\Games\Arma3\A3Master\network.cfg.cfg -mod=@CBA_A3 -BEPath=C:\Games\Arma3\A3Master\Battleye -world=Tanoa -port=2302
echo Server Initiated
:bec
::taskkill /f /im  "bec.exe"
::timeout 10
:: Path to BEC Folder
::cd "C:\Games\Arma3\A3Master\BEC\"
:: Path to BEC.exe
::start "bec" "C:\Games\Arma3\A3Master\BEC\bec.exe" -f Config.cfg --dsc
@echo Server Bec initiated!
:: =================If running headless client, replace "HC .exe" with name of headless client .exe and remove "::"=================
:: @echo Waiting to launch Headless Client
:: timeout 30
:: @echo Launching Headless Client
::tasklist /fi "imagename eq arma3client.exe" |find ":" > nul
:: if errorlevel 1 taskkill /f /im  "HC.exe"
:: start /wait /b /high /affinity C0 C:\Games\Arma3\A3Master\arma3client.exe -client -connect=127.0.0.1 -port=2302 -profiles=C:\Games\Arma3\A3Master\Profiles -name=headlessclient -mod=@CBA_A3
:monitor
timeout 30 
:: Rename "servermonitor.exe" to what ever you are doing to call the monitor system
tasklist /fi "imagename eq servermonitor.exe" /fi "status eq running" |find  /i "servermonitor.exe"  >nul && ( 
goto end
) || ( 
:: Path to Server Monitor
start "servermonitor" "C:\Games\Arma3\A3Files\servermonitor.exe"
)
:end
@echo Server Startup Complete
@echo Closing Down
timeout 10
exit
