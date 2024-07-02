{ config, pkgs, ... }:
let 
  myAliases = {
    ll = "ls -l";
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
  };
}
