{pkgs, ...}: {
  home.packages = with pkgs; [
    freeglut
  ];
}
