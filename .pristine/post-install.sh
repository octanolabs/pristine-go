#!/bin/bash

BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m" # No Color

defaultGithub="octanolabs/pristine-go"
defaultBinary="pristine"

echo ""
echo "💎  Welcome Pristine Go Post-Install setup! 💎"
echo ""
echo ""

echo -e "${BLUE}Enter the github repository short path (e.g ${defaultGithub}):${NC}"

read repo

echo ""

echo -e "${BLUE}Enter the executable/binary name (e.g ${defaultBinary}):${NC}"

read binary

echo ""

# using ~ in place of / to avoid slashes in package names conflicting with sed
sed -i  "" -e "s~${defaultGithub}~${github}~g"  .circleci/config.yml
sed -i  "" -e "s~${defaultBinary}~${binary}~g"  .circleci/config.yml

echo -e "${BLUE} 🚀  Project Setup Completed. 🚀"

echo ""
