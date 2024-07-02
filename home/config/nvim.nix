{ pkgs, lib, ... }:

{
  xdg.configFile.nvim.source = ./compat/nvim;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      gcc
    ];
  };
}
