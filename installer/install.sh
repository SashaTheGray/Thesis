#!/bin/bash
# This script installs Thesis.

# GLOBALS
PACKAGE_MANAGER="NONE"

# DETERMINE SYSTEM'S PACKAGE MANAGER.

# Declare a system -> package manager associative array.
declare -A PM_LOOKUP=(
    [/etc/debian_version]="apt"
)

# Determine package manager.
for file in ${!PM_LOOKUP[@]};
do
    echo "[*] Thesis is determining system's package manager"
    if [[ -f $file ]]; then
        PACKAGE_MANAGER=${PM_LOOKUP[$file]}
        echo "[+] Thesis has found $PACKAGE_MANAGER"
        break
    fi
done

# Abort if no suitable package manager was found.
if [ $PACKAGE_MANAGER = "NONE" ]; then
    echo "[-] Thesis cannot determine the systems package manager"
    echo "[*] Thesis is aborting installation ..."
    exit 1

# INSTALL PACKAGES



# STOW SYMLINKS

# ZSH SETUP.
if ["$SHELL" != "$(which zsh)"]; then
    
    # Get path of the zsh executable.
    zsh_path=$(which zsh)

    # Change shell for $USER to zsh.
    sudo chsh -s $zsh_path $USER
    
    # Explictly set the current shell as zsh.
    export SHELL=$zsh_path
fi


