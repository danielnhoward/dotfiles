{pkgs, ...}: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./gc.nix
    ./hosts.nix
    ./locale.nix
    ./nix.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [3000];

  console.keyMap = "uk";

  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.dconf.enable = true;

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

  programs.ssh.startAgent = true;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  system.stateVersion = "25.11";
}
