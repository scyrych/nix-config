{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      enable-hot-corners = false;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
        "space-bar@luchrioh"
	"appindicatorsupport@rgcjonas.gmail.com"
	"rounded-window-corners@yilozt"
	"blur-my-shell@aunetx"
      ];
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
    gnomeExtensions.space-bar
    gnomeExtensions.appindicator
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.blur-my-shell
  ];
}
