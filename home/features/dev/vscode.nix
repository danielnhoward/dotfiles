{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      zhuangtongfa.material-theme

      ms-vsliveshare.vsliveshare

      jnoortheen.nix-ide
      haskell.haskell
      justusadam.language-haskell
    ];

    userSettings = {
      editor = {
        formatOnSave = true;
        cursorSmoothCaretAnimation = "on";
        cursorBlinking = "smooth";
        selectionClipboard = false;
      };

      files = {
        insertFinalNewLine = true;
        trimTrailingWhitespace = true;
      };

      terminal = {
        explorerKind = "external";
        external.linuxExec = "kitty";
      };

      workbench = {
        startupEditor = "none";
        iconTheme = "material-icon-theme";
        colorTheme = "One Dark Pro";
      };

      nix = {
        enableLanguageServer = true;
        serverPath = "${pkgs.nil}/bin/nil";
        formatterPath = "${pkgs.alejandra}/bin/alejandra";
        serverSettings.nil.formatting.command = ["alejandra"];
      };

      "[haskell]" = {
        "editor.formatOnSave" = false;
        "editor.tabSize" = 2;
      };
    };
  };
}
