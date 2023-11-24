{ lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    package = pkgs.unstable.alacritty;
  };
  xdg.configFile."alacritty/alacritty.yml".source = ./alacritty.yml;
  xdg.configFile."alacritty/catppuccin-mocha.yml".source = ./catppuccin-mocha.yml;
}
