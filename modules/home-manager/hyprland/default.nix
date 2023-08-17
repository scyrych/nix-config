{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    package = null;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
