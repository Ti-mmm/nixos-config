{
  description = "Ti-mmm's personal flake configuration!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
   # NixOS configuration entrypoint
   # Available through 'nixos-rebuild --flake .#your-hostname'

   nixosConfigurations = {
     nixos = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit inputs; }; # Pass flake inputs to our config
       # > Our main nixos configuration file <
       modules = [ 
         ./hosts/pc/configuration.nix
       ];
     };
   };

   # home-manager configuration entrypoint
   # Available through 'home-manager --flake .#your-username@your-hostname'
   homeConfigurations = {
     "tim@nixos" = home-manager.lib.homeManagerConfiguration {
       pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
       extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
       # > Our main home-manager configuration file <
       modules = [ 
           ./home-manager/home.nix 
           ];
     };
   };
 };
}
