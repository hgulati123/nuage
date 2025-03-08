#!/bin/bash
cd /home/ubuntu/nuage
git pull origin main
source venv/bin/activate
pip install -r requirements.txt
PID=$(pgrep -f "python3 app.py")
echo "$PID is outside if"
if [ -n "$PID" ]; then
  echo "Stopping existing app process: $PID"
  kill -9 "$PID"
  sleep 10
else
  echo "No running Flask process found."
fi
nohup python3 app.py > output.log 2>&1 &
disown
echo "Deployment completed successfully."
