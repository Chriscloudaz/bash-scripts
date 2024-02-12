#!/bin/bash 

logfile="/var/log/server_script.log"
errorlog="/var/log/server_script_errors.log"
host_directory="/etc/nginx/sites-enabled"
web_directory="/var/www/html"
server_ip="127.0.0.1"

check_exit_status() {
    if [ $? -ne 0 ]; 
    then
        echo "An error occurred, please check the errorlog file."
        exit   # Exit the script with a non-zero exit code
    fi
}

# Checks if user has root permissions to run the script

if [ "$(id -u)" -eq 0 ]; 
then
        echo "You're root user, running script"
else
        echo "You're not the root user, you need root permissions to run this script"
        exit # Exit if user is not root user"
fi

# Updates the system

sudo apt update 1>>$logfile 2>>$errorlog
check_exit_status

sudo apt upgrade -y 1>>$logfile 2>>$errorlog
check_exit_status 

# Installs NGINX server 

sudo apt update 1>>$logfile 2>>$errorlog
check_exit_status

sudo apt install nginx -y 1>>$logfile 2>>$errorlog
check_exit_status

# Configure Hostname and Localhost

echo "Please enter your preferred hostname"
read hostname

echo "server {
       listen 80;
       listen [::]:80;

       server_name $hostname;

       root /var/www/;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}" >> "$host_directory/$hostname.conf" 1>>$logfile 2>>$errorlog
check_exit_status

# Map hostname to localhost

echo "$server_ip $hostname" >> /etc/hosts 1>>$logfile 2>>$errorlog
check_exit_status 


# Create a Sample Web Page
echo "Hello, World!" | sudo tee "$web_directory/index.html" 1>>$logfile 2>>$errorlog
check_exit_status

# Start and Enable Web Server Service

sudo service nginx restart 1>>$logfile 2>>$errorlog
check_exit_status

# Report completion
echo "Server successfully setup"
echo $hostname 
echo $server_ip