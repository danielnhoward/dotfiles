{pkgs, ...}: {
  users.users.dnh = {
    isNormalUser = true;
    description = "Daniel Howard";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
    shell = pkgs.zsh;
    home = "/home/dnh";
  };
}
