{pkgs, ...}: {
  home.packages = with pkgs; [
    # (texlive.combine {
    #   inherit (pkgs.texlive) scheme-medium svg;
    # })
    (texlive.withPackages (ps:
      with ps; [
        scheme-full
        svg
      ]))
  ];
}
