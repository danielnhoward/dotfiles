{pkgs, ...}: {
  imports = [
    ./background
    ./polybar
    ./rofi
  ];

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      conf = ./config.def.h;
      patches = [
        (pkgs.fetchpatch {
          url = "https://github.com/mihirlad55/dwm-anybar/releases/download/v1.1.2/dwm-anybar-polybar-tray-fix-20210926-a786211.diff";
          hash = "sha256-qHCeKwT+BjkrIvY0FqMI8B1N1J49ymePSGTu9zjeaDw=";
        })
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    slock
  ];
  security.wrappers.slock = {
    source = "${pkgs.slock}/bin/slock";
    owner = "root";
    group = "root";
    setuid = true;
  };

  services.picom.enable = true;
}
