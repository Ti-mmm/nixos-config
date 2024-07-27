{ config, pkgs, ... }: {

  programs.helix = {
    enable = true;
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];

    settings = {
      theme = "term16_dark";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor = { line-number = "relative"; };
      editor.file-picker = { hidden = false; };
    };

  };
}
