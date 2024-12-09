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

# Step 3: Create .env.local file
echo "Configuring environment variables..."
cat <<EOL > .env.local
NEXT_PUBLIC_PRIVY_API_KEY=your-privy-api-key
NEXT_PUBLIC_BASE_NETWORK_URL=https://base-network.example.com
NEXT_PUBLIC_SMART_CONTRACT_ADDRESS=0xc7b849FEFAA0874429242C54A73564e2Da3B3054
NEXT_PUBLIC_COINBASE_API_KEY=your-coinbase-api-key
EOL
echo ".env.local file created. Please update it with your actual API keys and URLs."

# Step 4: Build the project
echo "Building the project..."
npm run build

# Step 5: Start the development server
echo "Starting the development server..."
npm run dev

# Notes for the user
echo "\n\n===================================================="
echo "Setup is complete!"
echo "- Update '.env.local' with your actual API keys and URLs if not done already."
echo "- The application is running at http://localhost:3000."
echo "- To deploy smart contracts, refer to the project's documentation."
echo "====================================================\n\n"
