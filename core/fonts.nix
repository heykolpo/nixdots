{ pkgs, ...}:

{
  fonts.fontconfig = {
    subpixel.rgba = "rgb";
    defaultFonts.sansSerif = [
      "Inter"
      "Noto Sans"
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
