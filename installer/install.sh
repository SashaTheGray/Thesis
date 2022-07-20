# This script installs Thesis.

# 1. Install packages.

# 2. Set zsh as shell if it isn't already.
if ["$SHELL" != "$(which zsh)"]; then
    
    # Get path of the zsh executable.
    zsh_path=$(which zsh)

    # Change shell for $USER to zsh.
    sudo chsh -s $zsh_path $USER
    
    # Explictly set the current shell as zsh.
    export SHELL=$zsh_path

    # Run zsh.
    exec zsh
fi

# 3. Stow symlinks.
