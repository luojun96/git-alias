# git-alias

This repository contains a list of useful git aliases, which can be added to your .gitconfig file. And we provide a user-friendly script to help you add these aliases to your .gitconfig file.

## Requirements

- jq-1.6

## Usage

### Add aliases to the `gitconfig-alias.json` file in this repository

for example, config the alias of `checkout` to `co` like below:

```json
{
    "name": "co",
    "command": "checkout"
}
```

### Run the script `update-git-alias.sh` to add aliases to your .gitconfig file

```bash
./update-git-alias.sh
```
