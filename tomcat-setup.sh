#!/bin/bash

# Author: Chris Parbey

log_file="/home/ubuntu/tomcat-log.txt"
current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

# Check if the log file exists; if not, create it
if [ ! -e "$log_file" ]; then
    touch "$log_file" || { echo "Error: Unable to create log file." >&2; exit 1; }
fi

# Set hostname
sudo hostnamectl set-hostname tomcat || { echo "Error: Unable to set hostname." | tee -a "$log_file"; exit 1; }

# Update and upgrade
sudo apt update -y || { echo "Error: Unable to update packages." | tee -a "$log_file"; exit 1; }
sudo apt upgrade -y || { echo "Error: Unable to upgrade packages." | tee -a "$log_file"; exit 1; }

# Change directory to /opt/ and run commands in a subshell
(
    cd /opt/ || exit

    # Install dependencies
    sudo apt install default-jdk -y || { echo "Error: Unable to install dependencies." | tee -a "$log_file"; exit 1; }

    # Download and extract Apache Tomcat
    sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz
    sudo tar -xzvf apache-tomcat-9.0.85.tar.gz 
    sudo rm apache-tomcat-9.0.85.tar.gz
    sudo mv apache-tomcat-9.0.85/ /opt/tomcat9 || { echo "Error: Unable to install Tomcat." | tee -a "$log_file"; exit 1; }

    # Giving Executable Permission to Tomcat
    sudo chmod 777 -R /opt/tomcat9 || { echo "Error: Unable to set permissions for Tomcat." | tee -a "$log_file"; exit 1; }
)

# Create Symbolic Links to Start and Stop Tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat

# Start Tomcat
sudo /usr/bin/starttomcat || { echo "Error: Unable to start Tomcat." | tee -a "$log_file"; exit 1; }

echo "Hostname changed, Java & Tomcat installed successfully at $current_datetime." | tee -a "$log_file"
