{ pkgs, ...}:
let
  catppuccin_name = "Catppuccin-Macchiato-Standard-Sky-Dark";
  catppuccin = pkgs.catppuccin-gtk.override {
        accents = [ "sky" ];
        size = "standard";
        tweaks = [ "normal" ];
        variant = "macchiato";
  };
in
{
  # gtk settings
  gtk = {
    enable = true;
    theme = {
      name = catppuccin_name;
      package = catppuccin;
    };
    cursorTheme = {
      name = "Catppuccin-Macchiato-Light-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoLight;
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "sky";
      };
      name = "Papirus-Light";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/gtk.css";
  home.file.".config/gtk-4.0/gtk-dark.css".source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/gtk-dark.css";

  home.file.".config/gtk-4.0/assets" = {
    recursive = true;
    source = "${catppuccin}/share/themes/${catppuccin_name}/gtk-4.0/assets";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = catppuccin_name;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-qt";
  };
}
