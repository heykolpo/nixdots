{ inputs, config, pkgs, ... }:

{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs pkgs;};
    users.kolpo = import ../home/home.nix;
  };

  users.users.kolpo = {
    isNormalUser = true;
    description = "Kolpo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
    shell = pkgs.zsh;
  };
}
