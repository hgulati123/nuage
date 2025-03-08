#!/bin/bash
cd /home/ubuntu/nuage
python3 -m venv venv
source venv/bin/activate
echo "pulling the code from github"
git pull origin main
pip install -r requirements.txt
nohup python3 app.py > output.log 2>&1 &
disown
echo "Deployment completed successfully."
