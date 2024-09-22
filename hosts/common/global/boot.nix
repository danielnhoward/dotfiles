{...}: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      efiSupport = true;
      device = "nodev";
    };
    grub2-theme = {
      enable = true;
      theme = "stylish";
      footer = true;
    };
  };
}
