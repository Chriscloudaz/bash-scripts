#!/bin/bash

# Author: Chris Parbey
# Usage: Enter an integer to check if it's odd or even

echo "Welcome to the Odd-Even Checker. This is a quick way to check if a number is odd or even."

sleep 1

echo -n "Enter a number to check if it's odd or even: "
read -r num

# Print three dots with pauses
echo -n "."
sleep 1
echo -n "."
sleep 1
echo -n "."
echo   # Move to the next line

if (( num % 2 == 0 )); then
    echo "$num is an even number"
else
    echo "$num is an odd number"
fi