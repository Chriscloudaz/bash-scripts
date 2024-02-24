#!/bin/bash

# Author: Chris Parbey
# Usage: script $arg1(search word) $arg2(replacement) $arg3(file path)

search_word="$1"
replacement="$2"
filePath="$3"

if [ "$#" -ne 3 ]; then
        echo "Please provide the following arguments: search_word replacement file_path"
        exit
else
    sed "s/${search_word}/${replacement}/" "$filePath"
fi
