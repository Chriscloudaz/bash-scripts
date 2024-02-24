#!/bin/bash

# Author: Chris Parbey 
# Usage: Input two integers to calculate the sum

num1=""
num2=""

echo "Welcome to the add number script. It is a quick way to add any two numbers of your choice."

sleep 1

echo -n "Please enter the first number you want to add: "
read -r num1

sleep 1

echo -n "Please enter the second number you want to add: "
read -r num2

# Input validation
if [[ ! "$num1" =~ ^[0-9]+$ || ! "$num2" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter numeric values only."
    exit 1
fi

# Print three dots with pauses
echo -n "."
sleep 1
echo -n "."
sleep 1
echo -n "."
echo   # Move to the next line

sum="$(( num1 + num2 ))"

echo "The sum of your numbers is $sum"