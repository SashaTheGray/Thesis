#!/bin/bash
# This script installs Thesis.

# DETERMINE SYSTEM'S PACKAGE MANAGER.

# Declare a system -> package manager associative array.
declare -A PM_LOOKUP=(
    [/etc/debian_version]=apt
)

# Determine package manager.
PACKAGE_MANAGER="NONE"

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
fi

# INSTALL PACKAGES
PACKAGES=(
    git         # Version control system.
    zsh         # Shell alternative.
    neovim      # Text editor.
    tmux        # Terminal multiplexer.
    stow        # Symlink farm
    bat         # A better cat command.
    fzf         # Fuzzy finder.
)

echo "[*] Thesis is installing ${#PACKAGES[@]} packages"

# Associatice array for package manager installation commands.
declare -A PMIC=(
    [apt]="apt install"]
)

# Install packages.
for package in $PACKAGES;
do
    eval "${PMIC[$PACKAGE_MANAGER]} $package" > /dev/null
done


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


