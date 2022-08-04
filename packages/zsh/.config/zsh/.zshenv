#!/bin/bash

echo "--- Configuring ZSH ---"
echo "[*] Loading zsh environment variables"

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
export EDITOR="nvim"
export ANTIGEN_AUTO_CONFIG=false
export ADOTDIR=$HOME/.config/antigen
