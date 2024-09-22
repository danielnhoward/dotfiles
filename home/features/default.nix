{pkgs, ...}: {
  imports = [
    ./dev
    ./virtualisation
    ./web
  ];

  home.packages = with pkgs; [
    alejandra
    nil
  ];
}
