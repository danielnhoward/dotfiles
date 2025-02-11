{pkgs, ...}: {
  # home.packages = with pkgs; [
  #   (haskellPackages.ghcWithPackages (p:
  #     with p; [
  #       haskell-language-server
  #       hoogle
  #       cabal-install
  #       GLUT
  #     ]))
  # ];
  home.packages = with pkgs; [
    (haskell.packages.ghc948.ghcWithPackages (p:
      with p; [
        haskell-language-server
        hoogle
        # cabal-install
        GLUT
      ]))
    haskellPackages.cabal-install
  ];
}
