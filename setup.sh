#!/bin/bash

# Clone necessary repositories
echo "Cloning NixOS configuration..."
git clone https://github.com/31nk/nixos-config ~/nixos-config

echo "Cloning dotfiles..."
git clone https://github.com/31nk/dotfiles ~/dotfiles

# Link Home Manager configuration
mkdir -p ~/.config/home-manager
ln -sf ~/dotfiles/home.nix ~/.config/home-manager/home.nix

# Rebuild NixOS
echo "Rebuilding NixOS..."
sudo nixos-rebuild switch --flake ~/nixos-config

# Apply Home Manager configuration
echo "Applying Home Manager configuration..."
home-manager switch

echo "Setup complete! 🚀"

