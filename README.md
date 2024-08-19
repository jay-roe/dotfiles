# My Dotfiles

## Getting started on NixOS
1. On the base NixOS install, open the terminal and run `nix-shell -p git`. *This opens a shell with access to git installed*
2. From the home directory, run `git clone https://github.com/jay-roe/dotfiles`
3. To make sure it works on this system, run `sudo cp /etc/nixos/hardware-configuration.nix ~/dotfiles/nixos`
4. Now rebuild using `sudo nixos-rebuild switch --flake ~/dotfiles` (if it doesn't work you might just need to add `#enterprise` after `dotfiles`)
5. To setup the user and it's software, run `home-manager switch --flake ~/dotfiles`
6. Reboot the system into the new generation!