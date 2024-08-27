Note: Everything here is WiP. I am new to NixOS, just exploring.

# TODOs:

- [ ] migrate app settings to home-manager:
  - [x] hyprland
  - [x] kitty
  - [ ] waybar
  - [ ] zsh
  - [ ] git
- [ ] customize webcord appearance using and import it to home-manager
- [ ] import obsidian notes to repo, link them
- [ ] modularize nixos-config (for multiple device setups)
- [ ] ...

## Commands

Compile using:

`home-manager switch --flake .#tim@nixos`

`sudo nixos-rebuild switch --flake .#nixos`

## First-Time Setup

On a new machine, use the commands from [cola-gang.industries](https://cola-gang.industries/nixos-for-the-confused-part-i):

**PASTE YOUR /etc/nixos/hardware-configuration.nix beforehand!!**

You may need to change the username and hostname depending on your NixOS installation

```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#home-manager
sudo nixos-rebuild boot --flake .#tim
home-manager switch --flake .#tim@nixos
```

Download size is around 3GiB

# Credits / Inspiration

- Waybar: [XNM1](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles?tab=readme-ov-file)
