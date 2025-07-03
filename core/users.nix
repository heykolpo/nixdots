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

  users.users.user1 = {
    isNormalUser = true;
    description = "user1";
    extraGroups = [ "networkmanager" "wheel" ];
    home = "/home/user1";
    packages = with pkgs; [
      zsh
    ];
    shell = pkgs.zsh;
  };
}
