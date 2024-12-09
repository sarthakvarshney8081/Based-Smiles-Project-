#!/bin/bash

# Define environment variables
ENV_FILE=".env"

echo "Configuring environment variables..."

# Check if the .env file exists, create if not
if [ ! -f "$ENV_FILE" ]; then
  echo "Creating a new .env file..."
  touch $ENV_FILE
fi

# Add or update Privy App ID
if grep -q "NEXT_PUBLIC_PRIVY_APP_ID=" "$ENV_FILE"; then
  sed -i 's/^NEXT_PUBLIC_PRIVY_APP_ID=.*/NEXT_PUBLIC_PRIVY_APP_ID=cm4gj3ngp03vh122koi0w1h5e/' "$ENV_FILE"
else
  echo "NEXT_PUBLIC_PRIVY_APP_ID=cm4gj3ngp03vh122koi0w1h5e" >> "$ENV_FILE"
fi

# Add or update Supabase credentials
if grep -q "NEXT_PUBLIC_SUPABASE_URL=" "$ENV_FILE"; then
  sed -i 's|^NEXT_PUBLIC_SUPABASE_URL=.*|NEXT_PUBLIC_SUPABASE_URL=https://uwqnrvilosdjhqrkpeur.supabase.co|' "$ENV_FILE"
else
  echo "NEXT_PUBLIC_SUPABASE_URL=https://uwqnrvilosdjhqrkpeur.supabase.co" >> "$ENV_FILE"
fi

if grep -q "NEXT_PUBLIC_SUPABASE_ANON_KEY=" "$ENV_FILE"; then
  sed -i 's|^NEXT_PUBLIC_SUPABASE_ANON_KEY=.*|NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV3cW5ydmlsb3NkamhxcmtwZXVyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3MjE0OTcsImV4cCI6MjA0OTI5NzQ5N30.n_YX7boWE8fo8Po5S3_90c7COo9vxxgsRfLjUbRWgzQ|' "$ENV_FILE"
else
  echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV3cW5ydmlsb3NkamhxcmtwZXVyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3MjE0OTcsImV4cCI6MjA0OTI5NzQ5N30.n_YX7boWE8fo8Po5S3_90c7COo9vxxgsRfLjUbRWgzQ" >> "$ENV_FILE"
fi

echo "Environment variables configured successfully!"

# Install dependencies
echo "Installing project dependencies..."
npm install

# Run the development server
echo "Starting the development server..."
npm run dev
