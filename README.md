Note: Everything here is WiP. This is not made to be used by someone else.

# TODOs:

- [ ] rice everything (catppuccin-mocha-mauve):
  - [x] use catppuccin-mocha-mauve flake
  - [x] btop
  - [x] qt
  - [x] gtk
  - [ ] rofi
  - [ ] waybar + new layout
  - [ ] transparency:
    - [x] kitty
    - [ ] vesktop
    - [ ] firefox
  - [ ] OR: hyprland: make inactive windows slightly transparent
  - [ ] style firefox websites like https://github.com/catppuccin/userstyles/blob/main/docs/USAGE.md
- [ ] firefox settings in home-manager
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
sudo nixos-rebuild boot --flake .#nixos
home-manager switch --flake .#tim@nixos
```

# Credits / Inspiration

- Waybar: [XNM1](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles?tab=readme-ov-file)
