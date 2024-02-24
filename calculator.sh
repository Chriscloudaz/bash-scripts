#!/bin/bash

# Author: Chris Parbey
# Usage: Enter two integers and select an operation

num1=""
num2=""

# Function to display menu
display_menu () {
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
}

# Function to handle invalid input
handle_invalid_input() {
    echo "Invalid input. Please enter numeric values only."
    exit 1
}

# Functions for arithmetic operations
calculate_addition() {
    if [[ ! "$num1" =~ ^[0-9]+$ || ! "$num2" =~ ^[0-9]+$ ]]; then
        handle_invalid_input
    fi

    sum="$(( num1 + num2 ))"
    echo "The sum of $num1 and $num2 is $sum"
}

calculate_subtraction() {
    if [[ ! "$num1" =~ ^[0-9]+$ || ! "$num2" =~ ^[0-9]+$ ]]; then
        handle_invalid_input
    fi

    diff="$(( num1 - num2 ))"
    echo "The difference of $num1 and $num2 is $diff"
}

calculate_multiplication() {
    if [[ ! "$num1" =~ ^[0-9]+$ || ! "$num2" =~ ^[0-9]+$ ]]; then
        handle_invalid_input
    fi

    product="$(( num1 * num2 ))"
    echo "The product of $num1 and $num2 is $product"
}

calculate_division() {
    if [[ ! "$num1" =~ ^[0-9]+$ || ! "$num2" =~ ^[0-9]+$ || "$num2" -eq 0 ]]; then
        handle_invalid_input
    fi

    quotient="$(( num1 / num2 ))"
    echo "The quotient of $num1 and $num2 is $quotient"
}

# Main Script

# Welcome Message
echo "Welcome to the calculator app! Perform basic arithmetic by entering two numbers and selecting an operation."

echo "============================="
sleep 1

read -p "Enter the first number: " num1
sleep 1

read -p "Enter the second number: " num2
sleep 1

echo "============================="

display_menu
read -p "Choose an operation: " choice

case $choice in
    1)
        calculate_addition;;
    2)
        calculate_subtraction ;;
    3)
        calculate_multiplication ;;
    4)
        calculate_division ;;
    *)
        echo "Invalid choice" ;;
esac