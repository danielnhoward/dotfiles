{pkgs, ...}: {
  imports = [
    ./gc.nix
    ./hosts.nix
    ./locale.nix
    ./nix.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  console.keyMap = "uk";

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.fprintd.enable = true;

  programs.zsh.enable = true;

  virtualisation.libvirtd.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;

  system.stateVersion = "24.05";
}
