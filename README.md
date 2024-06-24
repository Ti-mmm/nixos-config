Note: Everything here is WiP. I am new to NixOS and am using this repo to learn and discover.

**TODOs:**

- [ ] migrate app settings to home-manager:
  - [x] hyprland
  - [x] kitty
  - [ ] waybar
  - [ ] zsh
  - [ ] git
  - [ ] (discord / betterdiscord?)
- [ ] write an actual README.md
- [ ] setup proper documentation

## Commands

Compile using:

`home-manager switch --flake .#tim@nixos`

`sudo nixos-rebuild switch --flake .#nixos`

## Installation

On a new machine, use the commands from [cola-gang.industries](https://cola-gang.industries/nixos-for-the-confused-part-i):

`export NIX_CONFIG="experimental-features = nix-command flakes"`

`nix shell nixpkgs#home-manager`

`sudo nixos-rebuild switch --flake .#hostname`

`home-manager switch --flake .#username@hostname`

# Credits

- Waybar: [XNM1](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles?tab=readme-ov-file)
