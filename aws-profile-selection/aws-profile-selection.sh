#!/bin/bash

# Path to AWS config file
AWS_CONFIG_FILE="$HOME/.aws/config"

# Check if the AWS config file exists
if [[ ! -f "$AWS_CONFIG_FILE" ]]; then
  echo "AWS config file not found at $AWS_CONFIG_FILE"
  exit 1
fi

# Extract profile names from the config file
PROFILES=$(grep -E '^\[profile ' "$AWS_CONFIG_FILE" | sed -E 's/^\[profile (.+)\]/\1/')

# If no profiles are found, exit
if [[ -z "$PROFILES" ]]; then
  echo "No AWS profiles found in $AWS_CONFIG_FILE"
  exit 1
fi

# Custom prompt for the select menu
PS3="Select your AWS profile by the number: "

# Display profiles and let the user select one
# echo "Available AWS profiles:"
select SELECTED_PROFILE in $PROFILES; do
  if [[ -n "$SELECTED_PROFILE" ]]; then
    # echo "Selected profile: $SELECTED_PROFILE"
    echo "export AWS_PROFILE=$SELECTED_PROFILE"
    break
  else
    echo "Invalid selection. Please try again."
  fi
done

# Export the selected profile
# echo "AWS_PROFILE is set to $AWS_PROFILE"
