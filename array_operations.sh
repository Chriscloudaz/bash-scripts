#!/bin/bash

# Author: Chris Parbey
# Usage: Add and remove elements in the array using the menu

# Initialize an array
fruits=("apple" "pear" "mango")

# Function to display the menu
display_menu() {
  echo "1. Add fruit"
  echo "2. Remove fruit"
  echo "3. Display current fruits"
  echo "4. Quit"
}

# Function to add an item to the array
add_item() {
  read -p "Enter item to add: " newFruit
  fruits+=("$newFruit")
  echo "New fruit added successfully."
}

# Function to remove an item from the array
remove_item() {
  read -p "Enter item to remove: " fruitToRemove
  fruits=("${fruits[@]/$fruitToRemove}")
  echo "Fruit removed successfully."
}

# Function to display the current array
display_array() {
  echo "Current list of fruits: ${fruits[@]}"
}

# Main script
while true; do
  display_menu
  read -p "Select an option (1-4): " choice

  case $choice in
    1)
      add_item;;
    2)
      remove_item;;
    3)
      display_array;;
    4)
      echo "Exiting script."
      exit;;
    *)
      echo "Invalid choice. Please enter a number from 1 to 4.";;
  esac
done