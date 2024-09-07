{ config, pkgs, ... }:

{

  imports = [
    # import nix configs
    ./config/nvim.nix
    ./config/sh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  # Packages
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Main
    baobab
    brave
    firefox
    neofetch
    obsidian

    # Programming tools
    gitkraken
    vscodium

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
