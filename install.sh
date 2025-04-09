#!/bin/sh

# Install git and deno
apk add git deno

# Check if the installation was successful
if [ $? -ne 0 ]; then
  echo "Error installing git and deno"
  exit 1
fi

# Remove the /1s directory if it exists
rm -rf /1s

# Clone the repository
git clone https://${GH_TOKEN}@github.com/hertlyhq/1s -b main /1s

# Check if the cloning was successful
if [ $? -ne 0 ]; then
  echo "Error cloning repository"
  exit 1
fi

# Change the working directory
cd /1s

# Run the deno application
deno run main

# Check if the deno application ran successfully
if [ $? -ne 0 ]; then
  echo "Error running deno main"
  exit 1
fi
