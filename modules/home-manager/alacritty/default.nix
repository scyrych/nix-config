{ lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
  };
  xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
  xdg.configFile."alacritty/catppuccin-mocha.yml".source = ./catppuccin-mocha.yml;
}
