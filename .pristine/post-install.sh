#!/bin/bash

BLUE="\033[0;34m"
RED="\033[0;31m"
NC="\033[0m" # No Color

defaultBinary="pristine"
defaultOrg="octanolabs"
defaultRepo="pristine-go"

echo ""
echo "💎  Welcome Pristine Go Post-Install setup! 💎"
echo ""
echo ""

echo -e "${BLUE}Enter the github org/user that owns this projects repository (e.g ${defaultOrg}):${NC}"

read orginization

echo ""

echo -e "${BLUE}Enter the github repository name for this project (e.g ${defaultRepo}):${NC}"

read repository

echo ""

echo -e "${BLUE}Enter the executable/binary name (e.g ${defaultBinary}):${NC}"

read binary

echo ""

defaultGithub="${defaultOrg}/${defaultRepo}"
github="${orginization}/${repository}"

# using ~ in place of / to avoid slashes in package names conflicting with sed
sed -i  "" -e "s~${defaultGithub}~${github}~g"  .circleci/config.yml
sed -i  "" -e "s~${defaultBinary}~${binary}~g"  .circleci/config.yml

sed -i  "" -e "s~${defaultGithub}~${github}~g"  internal/build/env.go

sed -i  "" -e "s~${defaultGithub}~${github}~g"  build/ci.go
sed -i  "" -e "s~${defaultBinary}~${binary}~g"  build/ci.go

sed -i  "" -e "s~${defaultRepo}~${repository}~g"  build/env.sh
sed -i  "" -e "s~${defaultOrg}~${orginization}~g"  build/env.sh

sed -i  "" -e "s~${defaultBinary}~${binary}~g"  Makefile

sed -i  "" -e "s~${defaultGithub}~${github}~g"  README.md
sed -i  "" -e "s~${defaultRepo}~${repository}~g"  README.md

git mv "cmd/${defaultBinary}" "cmd/${binary}"
# build/env.sh

echo -e "${BLUE} 🚀  Project Setup Completed. 🚀"

echo ""
