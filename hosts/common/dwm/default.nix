{pkgs, ...}: {
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.override {
      conf = ./config.def.h;
      # patches = [
      #   (pkgs.fetchpatch {
      #     url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-20250407-b1e217b.diff";
      #     hash = "sha256-60YiyPlQSGN3bk65VrIhc1RSO6Wfx9fAAkoQJLl8sW8=";
      #   })
      # ];
    };
  };
  environment.systemPackages = with pkgs; [
    dmenu
    dmenu-bluetooth
    brightnessctl
  ];
}
