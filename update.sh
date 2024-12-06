#!/bin/bash

echo "Please Enter the ID Num: "
read id
id="[$id]"

echo "Please Enter Updated Name: "
read name

echo "Please Enter Updated Salary: "
read salary

updatedData=($id $name $salary)

temp_file=$(mktemp)

# Loop through the file
while read -r line; do
    if [[ "$line" == *"${updatedData[0]}"* ]]; then
        # Split the line by delimiter ":"
        IFS=":" 
        read -ra parts <<< "$line"
        
        # Replace the name and salary with the updated data
        line="${parts[0]}:${updatedData[1]}:${updatedData[2]}"
    fi
    
    echo "$line" >> "$temp_file"
done < test.txt

# Move the temp file to the original file
mv "$temp_file" test.txt


