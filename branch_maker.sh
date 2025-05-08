#!/bin/bash

# Colors for retro effect
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Clear screen
clear

# Retro ASCII art intro
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║ ██████╗       ██████╗  █████╗ ███╗   ██╗ ██████╗██╗  ██╗ ║"
echo "║ ██╔══██╗      ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║  ██║ ║"
echo "║ ██████╔╝█████╗██████╔╝███████║██╔██╗ ██║██║     ███████║ ║"
echo "║ ██╔══██╗╚════╝██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══██║ ║"
echo "║ ██████╔╝      ██║  ██║██║  ██║██║ ╚████║╚██████╗██║  ██║ ║"
echo "║ ╚═════╝       ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝ ║"
echo "║            E D D E   - B R A N C H  M A K E R            ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to convert string to lowercase and replace spaces with hyphens
format_branch_name() {
    local input="$1"
    # Extract ticket number (assuming format like QI-XXXXX)
    local ticket_number=$(echo "$input" | grep -o '[A-Z]\{2,\}-[0-9]\{1,\}')
    # Get the rest of the description
    local description=$(echo "$input" | sed "s/$ticket_number//")
    # Format description to lowercase and replace spaces with hyphens
    description=$(echo "$description" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    # Combine ticket number and description
    echo "${ticket_number}${description}"
}

# Get ticket number and description
echo -e "${GREEN}Enter ticket number and description (e.g., QI-11611 Implement Advanced Sorting Logic):${NC}"
read ticket_info

# Ask for branch type
echo -e "${GREEN}Is this a feature or bugfix? (f/b):${NC}"
read branch_type

# Process the input
if [[ $branch_type == "f" ]]; then
    prefix="feature"
elif [[ $branch_type == "b" ]]; then
    prefix="bugfix"
else
    echo -e "${RED}Invalid input. Using 'feature' as default.${NC}"
    prefix="feature"
fi

# Format the branch name
formatted_desc=$(format_branch_name "$ticket_info")
branch_name="git checkout -b ${prefix}/${formatted_desc}"

# Display the result
echo -e "\n${BLUE}Generated branch name:${NC}"
echo -e "${GREEN}$branch_name${NC}"

# Copy to clipboard if available
if command -v pbcopy &> /dev/null; then
    echo "$branch_name" | pbcopy
    echo -e "${CYAN}Branch name has been copied to clipboard!${NC}"
fi 