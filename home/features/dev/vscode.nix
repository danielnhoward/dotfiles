{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        scala-lang.scala
        scalameta.metals

        pkief.material-icon-theme
        zhuangtongfa.material-theme

        ms-vsliveshare.vsliveshare
        tomoki1207.pdf

        shardulm94.trailing-spaces

        jnoortheen.nix-ide
        haskell.haskell
        justusadam.language-haskell
        ms-python.python
        golang.go
        dbaeumer.vscode-eslint
        bradlc.vscode-tailwindcss

        james-yu.latex-workshop
        mechatroner.rainbow-csv

        ms-vscode.cpptools
        ms-vscode.cmake-tools

        ms-vscode.hexeditor

        yzane.markdown-pdf
      ];

      userSettings = {
        editor = {
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

        "files.watcherExclude" = {
          "**/.bloop" = true;
          "**/.metals" = true;
        };

        "[haskell]" = {
          editor = {
            tabSize = 2;
            rulers = [80];
          };
        };
        "[nix]" = {
          editor = {
            formatOnSave = true;
          };
        };
        "[c]" = {
          editor = {
            formatOnSave = true;
          };
        };
        "[h]" = {
          editor = {
            formatOnSave = true;
          };
        };
      };
    };
  };
}
