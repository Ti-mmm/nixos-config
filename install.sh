#!/usr/bin/env bash

RED='\033[0;31m'
RESET='\033[0m'

echo -e "${RED}requesting sudo access..."
sudo -v
echo "enabling nix-command & flakes..."
export NIX_CONFIG="experimental-features = nix-command flakes"
echo "enabling home-manager shell..."
nix shell nixpkgs#home-manager --command true
echo "switching to current nixos config..."
sudo nixos-rebuild boot --flake .#nixos
echo "switching to curren home config..."
home-manager switch --flake .#tim@nixos
