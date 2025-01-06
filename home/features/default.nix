{pkgs, ...}: {
  imports = [
    ./dev
    ./gnome
    # ./plasma
    ./virtualisation
    ./web
  ];

  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
