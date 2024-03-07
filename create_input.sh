#!/bin/bash
set +e

# create the output folder
mkdir -p input

# Iterate over each line in the file
while read chemical
do
    if [ ! -z "$chemical" ]; then  # Check if the line is not empty
        # Replace spaces with underscores for the filename and escape apostrophes
        filename=$(echo "$chemical" | sed "s/ /_/g" | sed "s/'/'\\\\''/g")

        echo "$chemical" > input/"$filename".txt
    fi
done < "chemicals.txt"

