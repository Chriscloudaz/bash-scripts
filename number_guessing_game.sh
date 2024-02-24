#!/bin/bash

# Author: Chris Parbey
# Usage: Generates a random number, user has to guess the number

# Generate a random number between 1 and 10
random_number=$((RANDOM % 10 + 1))

echo -n "Take a guess (between 1 and 10): "
read -r guess

# Check if the input is a valid number and not equal to the random number
until [[ "$guess" =~ ^[0-9]+$ && "$guess" -eq $random_number ]]; do
    echo "$guess is not the correct number. Please try again."
    read -r guess
done

echo  "Congratulations! You guessed correctly!"