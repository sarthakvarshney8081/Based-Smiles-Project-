#!/bin/bash

# Check for Node.js and npm
if ! command -v node &>/dev/null; then
  echo "Node.js is not installed. Please install it and try again."
  exit 1
fi

if ! command -v npm &>/dev/null; then
  echo "npm is not installed. Please install it and try again."
  exit 1
fi

# Install dependencies
echo "Installing dependencies..."
npm install

# Run the development server
echo "Starting the development server..."
npm run dev
