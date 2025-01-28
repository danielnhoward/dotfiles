{pkgs, ...}: {
  home.packages = with pkgs; [
    anki-web
  ];
}
