{
  description = "Ti-mmm's personal flake configuration! Has secure boot enabled.";

  inputs = {
    # === NixOS and HM sources ===
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Pinning stable & unstable regardless of the above definition of nixpkgs
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager"; # or /release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # === Utilities ===
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    # nixpkgs-stable,
    # nixpkgs-unstable,
    home-manager,
    catppuccin,
    lanzaboote,
    ...
  } @ inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main nixos configuration file <
        modules = [
          # Secure boot
          lanzaboote.nixosModules.lanzaboote
          # NixOS Config
          ./hosts/default/configuration.nix
        ];
      };
    };

    # home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      default = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; };
        # > Our main home-manager configuration file <
        modules = [
          ./hosts/default/home.nix
          catppuccin.homeManagerModules.catppuccin
        ];
      };
    };
  };
}
