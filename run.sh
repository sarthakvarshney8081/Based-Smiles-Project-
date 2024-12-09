#!/bin/bash

# Add Privy App ID to the environment file
ENV_FILE=".env"

echo "Setting up the Privy App ID..."
if [ ! -f "$ENV_FILE" ]; then
  echo "Creating a new .env file..."
  touch $ENV_FILE
fi

# Add or update the App ID in the .env file
if grep -q "NEXT_PUBLIC_PRIVY_APP_ID=" "$ENV_FILE"; then
  sed -i 's/^NEXT_PUBLIC_PRIVY_APP_ID=.*/NEXT_PUBLIC_PRIVY_APP_ID=cm4gj3ngp03vh122koi0w1h5e/' "$ENV_FILE"
else
  echo "NEXT_PUBLIC_PRIVY_APP_ID=cm4gj3ngp03vh122koi0w1h5e" >>"$ENV_FILE"
fi

echo "Privy App ID configured successfully!"

# Install dependencies
echo "Installing project dependencies..."
npm install

# Run the development server
echo "Starting the development server..."
npm run dev
