#!/bin/bash

# Author: Chris Parbey
# Usage: Choose from a list of menu items to  perform an action. 

# Function to check empty input file name
fileName_check () {
    while [[ -z "$1" ]]; do
        echo -n "You must enter a filename to proceed: "
     done
}

# Function to check empty input directory name
dirName_check () {
    while [[ -z "$1" ]]; do
        echo -n "You must enter a directory name to proceed: "
        read -r dirName
    done
}

# Function to make directory
make_directory () {
    echo -n "Enter a name for the directory: "
    read -r dirName
    dirName_check "$dirName"
    echo -n "Where should we place this directory? (default is current directory): " 
    read -r dirPath

    # Check if dirPath is not empty before appending it to dirName
    if [ -n "$dirPath" ]; then
        mkdir -p "$dirPath/$dirName"
    else
        mkdir -p "$dirName"
    fi
    echo "$dirName has been successfully created"
}

# Function to list all files in a given directory
list_files () {
    echo -n "Enter the directory path for the list command (default is current directory): "
    read -r dirPath

    # Check if dirPath is not empty before listing
    if [ -n "$dirPath" ]; then
        ls "$dirPath"
    else
        ls
    fi
}

create_file () {
    echo -n "Enter a name for the file: "  
    read -r  fileName
    fileName_check "$fileName"
    read -rp "Where should we place this file? (default is current directory): "  dirPath

    # Check if dirPath is not empty before appending it to fileName
    if [ -n "$dirPath" ]; then
        touch "$dirPath/$fileName"
    else
        touch "$fileName"
    fi
    echo "$fileName has been successfully created"
}

# Function to display menu
display_menu () {
    echo "Choose an operation:"
    echo "1. List files"
    echo "2. Create a directory"
    echo "3. Create a file"
    echo "4. Exit script"
}

# Main script
while true; do
    display_menu
    read -rp "Enter your choice (1-4): " choice

    case $choice in 
        1) 
            list_files;;
        2) 
            make_directory;;
        3) 
            create_file;;
        4) 
            echo "Exiting script" 
            exit;;
        *) 
            echo "Invalid choice" ;;
    esac
done