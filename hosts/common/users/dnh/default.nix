{
  pkgs,
  ...
}: {
  users.users.dnh = {
    isNormalUser = true;
    description = "Daniel Howard";
    extraGroups = ["networkmanager" "wheel"];
#    shell = pkgs.zsh;
    home = "/home/dnh";
  };
}
