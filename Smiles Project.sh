#!/bin/bash

# Script to set up and run the Based Smiles project

# Exit immediately if a command exits with a non-zero status
set -e

# Define project repository URL
REPO_URL="https://github.com/roshanbvadassery/basedsmiles"
PROJECT_DIR="basedsmiles"

# Step 1: Clone the repository
echo "Cloning the repository..."
git clone $REPO_URL
cd $PROJECT_DIR

# Step 2: Install dependencies
echo "Installing dependencies..."
npm install

# Step 3: Create .env.local file interactively
echo "Configuring environment variables..."
read -p "Enter your Privy API Key: " PRIVY_API_KEY
read -p "Enter your Base Network URL: " BASE_NETWORK_URL
read -p "Enter your Smart Contract Address: " SMART_CONTRACT_ADDRESS
read -p "Enter your Coinbase API Key: " COINBASE_API_KEY

cat <<EOL > .env.local
NEXT_PUBLIC_PRIVY_API_KEY=$PRIVY_API_KEY
NEXT_PUBLIC_BASE_NETWORK_URL=$BASE_NETWORK_URL
NEXT_PUBLIC_SMART_CONTRACT_ADDRESS=$SMART_CONTRACT_ADDRESS
NEXT_PUBLIC_COINBASE_API_KEY=$COINBASE_API_KEY
EOL

echo ".env.local file created with the provided values."

# Step 4: Build the project
echo "Building the project..."
npm run build

# Step 5: Start the development server
echo "Starting the development server..."
npm run dev

# Notes for the user
echo "\n\n===================================================="
echo "Setup is complete!"
echo "- The application is running at http://localhost:3000."
echo "- To deploy smart contracts, refer to the project's documentation."
echo "====================================================\n\n"
