{...}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  distro-grub-themes = {
    enable = true;
    theme = "nixos";
  };
}
