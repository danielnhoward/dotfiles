{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      zhuangtongfa.material-theme

      jnoortheen.nix-ide
    ];

    userSettings.editor.formatOnSave = true;
    userSettings.editor.cursorSmoothCaretAnimation = "on";
    userSettings.editor.cursorBlinking = "smooth";

    userSettings.files.insertFinalNewLine = true;
    userSettings.files.trimTrailingWhitespace = true;

    userSettings.workbench.iconTheme = "material-icon-theme";
    userSettings.workbench.colorTheme = "One Dark Pro";

    userSettings.nix.enableLanguageServer = true;
    userSettings.nix.serverPath = "${pkgs.nil}/bin/nil";
    userSettings.nix.formatterPath = "${pkgs.alejandra}/bin/alejandra";
    userSettings.nix.serverSettings.nil.formatting.command = ["alejandra"];
  };
}
