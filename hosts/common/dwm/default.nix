{pkgs, ...}: {
  imports = [
    ./polybar
    ./rofi
  ];

  services = {
    xserver = {
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.override {
          conf = ./config.def.h;
          patches = [
            (pkgs.fetchpatch {
              url = "https://github.com/mihirlad55/dwm-anybar/releases/download/v1.1.2/dwm-anybar-polybar-tray-fix-20210926-a786211.diff";
              hash = "sha256-qHCeKwT+BjkrIvY0FqMI8B1N1J49ymePSGTu9zjeaDw=";
            })
            # (pkgs.fetchpatch {
            #   url = "https://dwm.suckless.org/patches/current_desktop/dwm-current_desktop-5.8.2.diff";
            #   hash = "sha256-5xA1AdwWgxY8ayYFf0hTCjoRV+rn1m5DcZcmEAcEJ+k=";
            # })
            ./patches/ewmhtags.diff
          ];
        };
      };
      displayManager = {
        lightdm.background = ./YorkshireHay.jpg;
        sessionCommands = ''
          ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
            Xft.dpi: 120
            Xcursor.theme: Adwaita
            Xcursor.size: 24
          EOF
        '';
      };
      dpi = 120;
      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
        };
      };
    };
    picom.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      slock
      i3lock
    ];
    sessionVariables = {
      GDK_SCALE = "1.25";
      GDK_DPI_SCALE = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "0";
      QT_SCALE_FACTOR = "1.25";
    };
  };

  security.wrappers.slock = {
    source = "${pkgs.slock}/bin/slock";
    owner = "root";
    group = "root";
    setuid = true;
  };
}
