{pkgs, ...}: {
  home.packages = with pkgs; [
    (haskellPackages.ghcWithPackages (p:
      with p; [
        haskell-language-server
        hoogle
        cabal-install
        GLUT
      ]))
  ];
}
