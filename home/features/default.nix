{pkgs, ...}: {
  imports = [
    ./dev
    # ./dwm
    ./plasma
    ./virtualisation
    ./web
  ];

  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
