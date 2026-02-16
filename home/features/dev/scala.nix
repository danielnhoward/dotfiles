{pkgs, ...}: {
  home.packages = with pkgs; [
    scala-next
    scala-cli
    metals
    coursier
    sbt
    scalafmt
  ];
}
