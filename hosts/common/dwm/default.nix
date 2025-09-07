{pkgs, ...}: {
  imports = [
    ./polybar
    ./rofi
  ];

  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      conf = ./config.def.h;
      patches = [
        # (pkgs.fetchpatch {
        #   url = "https://github.com/mihirlad55/dwm-anybar/releases/download/v1.1.2/dwm-anybar-polybar-tray-fix-20210926-a786211.diff";
        #   hash = "sha256-qHCeKwT+BjkrIvY0FqMI8B1N1J49ymePSGTu9zjeaDw=";
        # })
        (pkgs.fetchpatch {
          url = "https://github.com/mihirlad55/dwm-anybar/releases/download/v1.1.2/dwm-anybar-20210926-a786211.diff";
          hash = "sha256-6Pj58Y0gYz25Eba5EsAUc/GZFTSvtyhgPqfo3jlgvPA=";
        })
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    (dmenu.override {
      patches = [
        (pkgs.fetchpatch {
          url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-20250407-b1e217b.diff";
          hash = "sha256-60YiyPlQSGN3bk65VrIhc1RSO6Wfx9fAAkoQJLl8sW8=";
        })
      ];
    })
    rofi
    rofi-bluetooth
    brightnessctl
    polybar
  ];
}
