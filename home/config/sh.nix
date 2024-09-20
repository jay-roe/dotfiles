{ config, pkgs, ... }:
let 
  myAliases = {
    ll = "ls -al";
    ".." = "cd ..";

    # Nix stuff
    nixdev = "nix develop ~/dotfiles/home";
    nixrebuild = "sudo nixos-rebuild switch --flake ~/dotfiles";
    nixupdate = "nix flake update --flake ~/dotfiles && nixrebuild";
    homerebuild = "home-manager switch --flake ~/dotfiles";
    
  };
in {
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;

    autosuggestion.enable = true;
    enableCompletion = true;

    history = {
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/history";
      save = 10000;
      size = 10000;
      share = true;
    };

    historySubstringSearch = {
      enable = true;
    };

    # powerlevel10k stuff
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}
    ];

    # exporting the cursor theme is a bit ugly but it works :) Make sure this matches the pointerCursor set in home.nix
    initExtra = ''
      source ~/.p10k.zsh
      export XCURSOR_THEME='Bibata-Modern-Ice' 
    '';
  };
}
