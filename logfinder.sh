#! /usr/bin/env sh
# Get logfile path
logpath=$(ssh admin@10.6.70.2 "ls -tr /home/lvuser/*log | tail -1")

# Copy file
scp admin@10.6.70.2:${logpath} latestlog.txt

# Remove old csv
rm -rf testdata.csv
echo "Count,LeftSpeedSetPoint,LeftSpeed,RightSpeedSetPoint,RightSpeed"> testdata.csv 

# counter
count=0

# Get lines containing PID data and create a csv line with the data
cat latestlog.txt | grep "LeftspeedSetPoint" | while read line; do
  count=$((count+1))
  tokens=($line)
  left_setpoint=${tokens[5]}
  left_speed=${tokens[8]}
  right_setpoint=${tokens[12]}
  right_speed=${tokens[15]}
  echo "$count,$left_setpoint$left_speed$right_setpoint,$right_speed" >> testdata.csv
done

# Show graph
python3 show_graph.py