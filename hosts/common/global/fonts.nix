{pkgs, ...}: {
  # fonts.packages = with pkgs; [
  #   (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
  # ];
  fonts.packages = with pkgs.nerd-fonts; [
    symbols-only
  ];
}
