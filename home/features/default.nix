{pkgs, ...}: {
  imports = [
    ./dev
    ./plasma
    ./virtualisation
    ./web
  ];

  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
