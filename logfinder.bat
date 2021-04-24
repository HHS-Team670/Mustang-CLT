REM Used to scp the latest log file to the laptop and echo certain tokens to a csv. 

REM ssh's onto the robot and sets LOGFILE to the path of the latest log file
REM scp the logfile to the laptop and echo's the variable names to a csv files
REM finally, the specific tokens mentioned in the command are echoed to the same csv file
REM Later, a graphing software could be used to graph the csv

ssh admin@10.6.70.2 "ls -tr /home/lvuser/*txt | tail -1" | find "lvuser" > %TEMP%%\logpath.txt
set /p LOGFILE=<%TEMP%\logpath.txt
del %TEMP%\logpath.txt
scp admin@10.6.70.2:%LOGFILE% latestlog.txt
echo "LeftSpeedSetPoint, LeftSpeed, RightSpeedSetPoint, RightSpeed"> testdata.csv 
(for /f "tokens=9,13,16,18" %%i in ('find "SetPoint" latestlog.txt') do @echo %%i %%j %%k, %%l) >> testdata.csv