{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    clang-tools
    include-what-you-use
    cmake
    gdb
  ];
}
