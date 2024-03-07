#!/bin/bash

# Create folders for empty and non-empty files
mkdir -p EmptyFiles NonEmptyFiles

# Loop through all text files in the current directory
for file in output/*.txt; do
  # Check if the file is empty
  if [ ! -s "$file" ]; then
    # Move empty files to EmptyFiles
    mv "$file" EmptyFiles/
  else
    # Move non-empty files to NonEmptyFiles
    mv "$file" NonEmptyFiles/
  fi
done

