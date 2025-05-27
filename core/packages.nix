{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.obs-studio.enable = true;
  programs.hyprland.enable = true;
  
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    git
    obsidian
    inter
    noto-fonts
    telegram-desktop
    home-manager
    nemo
    gnome-tweaks
    nixfmt-tree
    rofi-wayland
    grimblast
    kitty
    ibm-plex
    fastfetch
    pfetch
    btop
    libinput
    vimPlugins.lazy-nvim
    inkscape
    gpu-screen-recorder-gtk
    ffmpeg
    # pkgs
  ];
}
