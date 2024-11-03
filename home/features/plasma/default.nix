{pkgs, ...}: {
  programs.plasma = {
    enable = true;

    hotkeys.commands."launch-kitty" = {
      name = "Launch Kitty";
      key = "Ctrl+Shift";
      command = "kitty";
    };
  };

  home.packages = with pkgs.kdePackages; [
    kalk
    kclock
  ];
}
