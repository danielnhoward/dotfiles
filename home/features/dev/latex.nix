{pkgs, ...}: {
  home.packages = with pkgs; [
    (texlive.withPackages (ps:
      with ps; [
        scheme-full
        svg
      ]))
  ];
}
