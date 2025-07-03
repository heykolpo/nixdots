{ pkgs, ... }:

{
  programs.ssh.askPassword = "${pkgs.plasma5Packages.ksshaskpass}/bin/ksshaskpass";
}
