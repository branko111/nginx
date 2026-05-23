#!/bin/bash

# Configuration
CONF_DIR="/etc/nginx/sites-available"
ENABLED_DIR="/etc/nginx/sites-enabled"

# 1. List files and ask for selection
echo "Current Nginx configurations:"
ls "$CONF_DIR"
echo ""
read -p "Enter the name of the file to copy (e.g., s111.com): " OLD_FILE

# Check if source exists
if [ ! -f "$CONF_DIR/$OLD_FILE" ]; then
    echo "Error: File $OLD_FILE does not exist in $CONF_DIR"
    exit 1
fi

# 2. Ask for new domain name
read -p "Enter the new domain name (e.g., a.s111.com): " NEW_DOMAIN

# Define paths
NEW_FILE_PATH="$CONF_DIR/$NEW_DOMAIN"

# 3. Copy the file
sudo cp "$CONF_DIR/$OLD_FILE" "$NEW_FILE_PATH"

# 4. Replace old domain with new domain inside the new file
# Uses 'sed' to swap all instances of the old filename string with the new one
sudo sed -i "s/$OLD_FILE/$NEW_DOMAIN/g" "$NEW_FILE_PATH"

# 5. Create the symbolic link
sudo ln -s "$NEW_FILE_PATH" "$ENABLED_DIR/"

echo "-----------------------------------------------"
echo "Success!"
echo "New config created at: $NEW_FILE_PATH"
echo "Symbolic link created in sites-enabled."
echo "Remember to run 'sudo nginx -t' and 'sudo systemctl restart nginx' to apply changes."
