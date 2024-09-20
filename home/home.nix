{ config, pkgs, ... }:

{

  imports = [
    # import nix configs
    ./config/nvim.nix
    ./config/sh.nix
    ./config/wezterm.nix
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
    qalculate-gtk
    vlc

    # Programming tools
    gitkraken
    jetbrains-toolbox
    vscodium

    # Terminal stuff
    meslo-lgs-nf  # font for powerlevel10k
    wezterm  # emulator

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [
        "JetBrainsMono"
      ];
    })
  ];

  # Cursor
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
