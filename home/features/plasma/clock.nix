{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.kclock
  ];
}
