{ pkgs, ...}:

{
  fonts.fontconfig = {
    subpixel.rgba = "rgb";
    defaultFonts.sansSerif = [
      "Inter"
      "Noto Sans Bengali"
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
