#!/bin/bash

# Author: Chris Parbey 
# Usage: Greeting users by full name using two input variables

# Prompt for the first name
read -p "Please enter your first name: " firstName

sleep 1  # Pause for 1 second

# Prompt for the last name
read -p "Please enter your last name: " lastName

# Combine first and last names
fullName="${firstName} ${lastName}"

# Print three dots with pauses
echo -n "."
sleep 1
echo -n "."
sleep 1
echo -n "."
echo   # Move to the next line

# Greet the user
echo "Good day, ${fullName}"