#!/bin/bash


# Check that a .json file is passed as a command-line argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file.json>"
  exit 1
fi

# JSON file name passed as a command-line argument
json_file=$1

# Verify that the file exists
if [ ! -f "$json_file" ]; then
  echo "Error: File '$json_file' does not exist."
  exit 1
fi

# Extract the repositories content from the JSON file
repositories=$(jq -r '.repositories[]' "$json_file")

# Count the total number of elements
total=$(echo "$repositories" | wc -l)

# Calculate the split point
split=$(( (total + 1) / 2 ))

# Split into two parts
list1=$(echo "$repositories" | head -n "$split")
list2=$(echo "$repositories" | tail -n +$((split + 1)))

# Create the first JSON file
jq --argjson list1 "$(echo "$list1" | jq -Rsc 'split("\n")[:-1]')" '.repositories = $list1' templateRepo.json > "${json_file%.json}_part1.json"

# Create the second JSON file
jq --argjson list2 "$(echo "$list2" | jq -Rsc 'split("\n")[:-1]')" '.repositories = $list2' templateRepo.json > "${json_file%.json}_part2.json"
