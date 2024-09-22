{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../common/global
    ./../common/users/dnh
  ];

  networking.hostName = "pleco";

  services.xserver = {
    enable = true;
    xkb = {
      layout = "gb";
      variant = "";
    };
  };
}
