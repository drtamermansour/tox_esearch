#!/bin/bash
set +e

# create the output folder
mkdir -p output

# Define the fixed part of the query
fixed_query='("anxiety" OR "depressive disorder" OR "Neurotic Disorder" OR "Obsessive-Compulsive Disorder" OR "Panic Disorder" OR "Phobic Disorder" OR "Stress Disorder" OR "PTSD" OR "Mental disorder" OR "Psychiatric disorder")'

# Iterate over each line in the file
cat "$1" | while read chemical
do
    if [ ! -z "$chemical" ]; then  # Check if the line is not empty
        # Replace spaces with underscores for the filename and escape apostrophes
        filename=$(echo "$chemical" | sed "s/ /_/g" | sed "s/'/'\\\\''/g")
        escaped_chemical=$(echo "$chemical" | sed "s/'/'\\\\''/g")

        # Combine the fixed query with the current chemical
        query="$fixed_query AND \"$escaped_chemical\"[Title/Abstract]"

        echo "Processing $chemical"
        # Use esearch and efetch within a subshell
        esearch -db pubmed -query "$query" | efetch -format abstract > "output/${filename}.txt"
        echo "$chemical" "done"
    fi
done

