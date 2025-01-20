#!/bin/bash

# Function to display menu and read user choice
select_base_url() {
    echo "Select the base URL for cloning:"
    echo "1) gitlab.sfpci.aws.accor.net"
    echo "2) gitlab.softfactory-accor.net"
    read -rp "Enter your choice (1 or 2): " choice

    case $choice in
        1)
            BASE_URL="gitlab.sfpci.aws.accor.net"
            EXPORT_PATH="$HOME/git/$BASE_URL"
            GHORG_TOKEN="$(op item get "Accor CTA" --format json | jq -r '.fields[] | select(.label == "private token sfpci - molecule") | .value')"
            ;;
        2)
            BASE_URL="gitlab.softfactory-accor.net"
            EXPORT_PATH="$HOME/git/$BASE_URL"
            GHORG_TOKEN="$(op item get "Gitlab Soft-Factory" --format json | jq -r '.fields[] | select(.label == "token") | .value')"
            ;;
        *)
            echo "Invalid choice. Please run the script again and select 1 or 2."
            exit 1
            ;;
    esac
}

# Call the function to select base URL
select_base_url

# Export the environment variable based on the selection
export GHORG_ABSOLUTE_PATH_TO_CLONE_TO="$EXPORT_PATH"
echo "Selected base URL: $BASE_URL"
echo "Repositories will be cloned to: $GHORG_ABSOLUTE_PATH_TO_CLONE_TO"

# Ask for the organization or group name to clone
read -rp "Enter the organization or group name to clone: " ORG_NAME

# Execute the ghorg clone command with the selected base URL
ghorg clone "$ORG_NAME" --base-url https://"$BASE_URL" --token "$GHORG_TOKEN" --preserve-dir
