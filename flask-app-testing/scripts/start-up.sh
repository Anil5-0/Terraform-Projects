#!/bin/bash
sudo apt update -y # Update package lists (for ubuntu)
sudo apt-get install -y python3-flask  # Example package installation
cd /home/ubuntu
sudo nohup python3 app.py &