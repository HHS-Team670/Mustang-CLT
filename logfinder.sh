#! /usr/bin/env sh
# Get logfile path
logpath=$(ssh admin@10.6.70.2 "ls -tr /home/lvuser/*log | tail -1")

# Copy file
scp admin@10.6.70.2:${logpath} latestlog.txt

# Remove old csv
rm -rf testdata.csv
echo "LeftSpeedSetPoint, LeftSpeed, RightSpeedSetPoint, RightSpeed"> testdata.csv 

# Get lines containing PID data and create a csv line with the data
cat latestlog.txt | grep "LeftspeedSetPoint" | while read line; do
  tokens=($line)
  left_setpoint=${tokens[5]}
  left_speed=${tokens[8]}
  right_setpoint=${tokens[12]}
  right_speed=${tokens[15]}
  echo "$left_setpoint $left_speed $right_setpoint, $right_speed" >> testdata.csv
done
