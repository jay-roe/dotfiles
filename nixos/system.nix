{ pkgs, ... }:

{
  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = " nix-command flakes ";
    auto-optimise-store = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    neofetch
    neovim
    git
  ];

  # Services
  services = {
    xserver.enable = true;
    printing.enable = true; # Enable CUPS to print documents(?)
  };

  # Virtualization
  programs.virt-manager.enable = true;
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "enterprise";
  networking.networkmanager.enable = true;

  # Weekly garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Shell
  environment.shells = with pkgs; [ zsh bash ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Base version
  system.stateVersion = "24.05";
}

