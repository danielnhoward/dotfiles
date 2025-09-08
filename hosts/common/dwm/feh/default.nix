{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    feh
  ];

  environment.etc."feh/wallpaper.svg".source = ./wallpaper.svg;

  xsession.extraInit = ''
    feh --bg-fill /etc/feh/wallpaper.svg
  '';
}
