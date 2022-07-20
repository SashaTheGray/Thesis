# This script installs Thesis.

# 1. Install packages.

# 2. Set zsh as shell if it isn't already.
if ["$SHELL" != "$(which zsh)"]; then
    zsh_path=$(which zsh)
    sudo chsh -s $zsh_path $USER
    export SHELL=$zsh_path
fi

# 3. Stow symlinks.
