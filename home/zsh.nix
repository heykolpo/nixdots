{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "af-magic";
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.nix";
      relaunch-ags = "pkill js ; ags run -d ~/.nix/ags/ & disown";
    };

    history.size = 10000;
  };
}
