{pkgs, ...}: {
  imports = [./languages.nix];

  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      markdown-oxide
      nodePackages.vscode-langservers-extracted
      shellcheck
    ];

    settings = {
      #theme = "catppuccin_mocha";
      editor = {
        color-modes = true;
        completion-trigger-len = 1;
        completion-replace = true;
        cursorline = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        indent-guides.render = true;
        #inline-diagnostics = {
        #  cursor-line = "hint";
        #  other-lines = "error";
        #};
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };

      keys.normal.space.u = {
        f = ":format"; # format using LSP formatter
        w = ":set whitespace.render all";
        W = ":set whitespace.render none";
      };

      editor = {line-number = "relative";};
      editor.file-picker = {hidden = false;};
    };
  };
}
