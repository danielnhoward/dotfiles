{...}: {
  imports = [
    ./clock.nix
  ];

  programs.plasma = {
    enable = true;

    hotkeys.commands."launch-kitty" = {
      name = "Launch Kitty";
      key = "Ctrl+Shift";
      command = "kitty";
    };
  };
}
