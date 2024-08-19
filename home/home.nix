{ config, pkgs, ... }:

{

  imports = [
    # import nix configs
    ./config/gnome.nix
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

    # Gnome
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gnome-40-ui-improvements
    # gnomeExtensions.hide-top-bar
    gnomeExtensions.just-perfection
    gnomeExtensions.wallpaper-slideshow

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
