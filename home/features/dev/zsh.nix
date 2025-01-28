{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nixos#$HOST";
      labs = "ssh shell$(printf $[RANDOM%5+1]).doc.ic.ac.uk";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      tunnel() {
        if [[ "$1" == "" ]]; then
          echo "Usage: tunnel port"
          return 1
        fi
        cloudflared tunnel run --url=http://localhost:$1 $HOST
      }
    '';

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
    ];
  };
}
