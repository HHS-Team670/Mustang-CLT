ssh admin@10.6.70.2 "ls -tr /home/lvuser/*txt | tail -1" | find "lvuser" > %TEMP%%\logpath.txt
set /p LOGFILE=<%TEMP%\logpath.txt
del %TEMP%\logpath.txt
scp admin@10.6.70.2:%LOGFILE% latestlog.txt
echo "LeftSpeedSetPoint, LeftSpeed, RightSpeedSetPoint, RightSpeed"> testdata.csv 
(for /f "tokens=8,11,15,18" %%i in ('find "SetPoint" latestlog.txt') do @echo %%i %%j %%k, %%l) >> testdata.csv