{pkgs, ...}: {
  home.packages = with pkgs; [
    dmenu
    dmenu-bluetooth
    st
  ];
}
