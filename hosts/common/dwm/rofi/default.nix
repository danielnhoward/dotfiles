{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rofi
    rofi-bluetooth
  ];

  environment.etc."rofi/config.rasi".source = ./config.rasi;
  environment.etc."rofi/search.svg".source = ./search.svg;
  environment.etc."rofi/spotlight.rasi".source = ./spotlight.rasi;
}
