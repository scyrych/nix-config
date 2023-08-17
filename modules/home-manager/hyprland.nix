{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    package = null;
    extraConfig = ''
      monitor=,preferred,auto,1

      # Execute your favorite apps at launch
      exec-once = waybar & swww init & dunst
      
      # Custom binds
      bind = $mainMod, SPACE, exec, rofi -show drun -show-icons

      # Move active window
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, L, movewindow, r
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, J, movewindow, d
    '';
  };
}
