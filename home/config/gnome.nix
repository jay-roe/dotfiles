{ pkgs, ... }:

{
  dconf = {
    enable = true;  # TODO check if can remove
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "gnome-ui-tune@itstime.tech"
          #"hidetopbar@mathieu.bidon.ca"
          "just-perfection-desktop@just-perfection"
          "azwallpaper@azwallpaper.gitlab.com"
        ];
      };
    };
  };
}