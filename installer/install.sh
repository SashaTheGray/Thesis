#!/bin/bash
# This script installs Thesis.

# DETERMINE SYSTEM'S PACKAGE MANAGER.

# Declare a system -> package manager associative array.
declare -A PM_LOOKUP=(
    [/etc/debian_version]="apt"
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
    stow        # Symlink farm.
    bat         # A better cat command.
    fzf         # Fuzzy finder.
    unzip	    # Extraction tool.
    npm         # Node package manager.
    cargo       # Rust package manager.
    black       # Python formatter.
    flake8      # Python analysis tool.
)

echo "[*] Thesis is installing ${#PACKAGES[@]} packages ..."

# Associatice array for package manager installation commands.
declare -A PMIC=(
    [apt]="apt-get -y install"
)

# Install packages.
for package in ${PACKAGES[@]};
do
    echo "[*] Thesis is installing $package"
    eval "${PMIC[$PACKAGE_MANAGER]} $package" > /dev/null
done

# Pip.
echo "[*] Thesis is installing pip packages"
echo "[*] Thesis is installing black"
pip install black

echo "[*] Thesis is installing flake8"
pip install flake8

# Npm.
echo "[*] Thesis is installing npm packages"
echo "[*] Thesis is installing prettier"
npm install -g prettier

# Cargo.
echo "[*] Thesis is installing cargo packages"
echo "[*] Thesis is installing stylua"
cargo install stylua

echo

echo "[+] Thesis finished installing packages"


# STOW SYMLINKS

# ZSH SETUP.
if [ "$SHELL" != "/usr/bin/zsh" ] ; then
    
    # Get path of the zsh executable.
    zsh_path=$(which zsh)

    # Change shell for $USER to zsh.
    sudo chsh -s $zsh_path $USER
    
    # Explictly set the current shell as zsh.
    export SHELL=$zsh_path
fi


