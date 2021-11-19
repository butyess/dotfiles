#!/bin/bash

# install toggle-corp/alacritty-colorscheme

REPO=https://github.com/eendroroy/alacritty-theme.git
DEST="$HOME/.eendroroy-colorschemes"

# Get colorschemes
git clone $REPO $DEST

# Create symlink at default colors location (optional)
ln -s "$DEST/themes" "$HOME/.config/alacritty/colors"

