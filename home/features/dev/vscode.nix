{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      zhuangtongfa.material-theme

      ms-vsliveshare.vsliveshare
      tomoki1207.pdf

      shardulm94.trailing-spaces

      jnoortheen.nix-ide
      haskell.haskell
      justusadam.language-haskell

      james-yu.latex-workshop
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
        integrated.fontFamily = "'Hack', 'Symbols Nerd Font Mono'";
      };

      workbench = {
        startupEditor = "none";
        iconTheme = "material-icon-theme";
        colorTheme = "One Dark Pro";
        editorAssociations = {
          "*.pdf" = "pdf.preview";
        };
      };

      nix = {
        enableLanguageServer = true;
        serverPath = "${pkgs.nil}/bin/nil";
        formatterPath = "${pkgs.alejandra}/bin/alejandra";
        serverSettings.nil.formatting.command = ["alejandra"];
      };

      latex-workshop.formatting.latex = "latexindent";

      "[haskell]" = {
        editor = {
          formatOnSave = false;
          tabSize = 2;
          rulers = [80];
        };
      };
    };
  };
}
