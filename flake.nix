{
  description = "Home Manager configuration of kolpo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fonts.url = "github:jeslie0/fonts";

    ags.url = "github:aylur/ags"; 

   };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    lib = nixpkgs.lib;
    inherit (self) outputs;
    extraSpecialArgs = { inherit system inputs; };
    specialArgs = { inherit system inputs; };
  in 
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
           inherit inputs outputs;
      #     home-manager;
      };
      modules = [
          ./core
      ];
    };

    homeConfigurations = {
      kolpo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs lib inputs;
        extraSpecialArgs = { inherit inputs system pkgs; };
        modules = [./home];
      };
    };
  };
}
