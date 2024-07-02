{ pkgs, ... }:

{
  dconf = {
    enable = true;  # TODO check if can remove
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        disabled-extensions = [];  # I'm annoyed this works...
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "gnome-ui-tune@itstime.tech"
          # "hidetopbar@mathieu.bidon.ca"
          "just-perfection-desktop@just-perfection"
          "azwallpaper@azwallpaper.gitlab.com"
        ];
      };

      "org/gnome/shell/extensions/just-perfection" = {
        dash = false;
        dash-app-running = false;
        dash-separator = false;
        show-apps-button = false;
      };

      # "org/gnome/shell/extensions/azwallpaper" = {
      #   slideshow-directory = "home/jay/dotfiles/home/wallpapers/nord";
      #   # TODO I have to add some more sillyness like the file names and stuff...
      # };
    };
  };
}