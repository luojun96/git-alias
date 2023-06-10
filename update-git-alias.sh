#!/bin/sh

# update git config alias based on the gitconfig-alias file

# get the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# get the git config alias json file in current directory 
GITCONFIG_ALIAS_FILE=$DIR/gitconfig-alias.json

# check the file exists
if [ ! -f $GITCONFIG_ALIAS_FILE ]; then
    echo "gitconfig-alias.json file not found"
    exit 1
fi

# read the gitconfig alias json file
GITCONFIG_ALIAS_JSON=$(cat $GITCONFIG_ALIAS_FILE)

# get the length of the json array in the key "alias""
GITCONFIG_ALIAS_JSON_LENGTH=$(echo $GITCONFIG_ALIAS_JSON | jq '.alias | length')

# loop through the json array
for (( i=0; i<$GITCONFIG_ALIAS_JSON_LENGTH; i++ )); do
    # get the alias name
    ALIAS_NAME=$(echo $GITCONFIG_ALIAS_JSON | jq -r ".alias[$i].name")
    # get the alias command
    ALIAS_COMMAND=$(echo $GITCONFIG_ALIAS_JSON | jq -r ".alias[$i].command")
    # update the git config alias
    git config --global alias.$ALIAS_NAME "$ALIAS_COMMAND"
done

# print the git config alias and exit
git config --get-regexp alias | cut -d '.' -f 2-