{ pkgs, lib, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "pop-shell@system76.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/mutter" = {
      edge-tiling = false;
      workspaces-only-on-primary = false;
      dynamic-workspaces = true;
    };
    "org/gnome/shell/app-switcher" = { 
      current-workspace-only = false;
    };
    # Enable and configure pop-shell, see:
    # https://github.com/pop-os/shell/blob/master_jammy/scripts/configure.sh
    "org/gnome/shell/extensions/pop-shell" = {
      active-hint = true;
      smart-gaps = true;
      tile-by-default = true;
      gap-outer = lib.hm.gvariant.mkUint32 4;
      gap-inner = lib.hm.gvariant.mkUint32 4;
      active-hint-border-radius = lib.hm.gvariant.mkUint32 15;
      hint-color-rgba = "rgba(139, 213, 202, 1)";
      activate-launcher = [ "<Super>Space" ];
    };
    # disable incompatible shortcuts
    "org/gnome/mutter/wayland/keybindings" = {
      # restore the keyboard shortcuts: disable <super>escape
      restore-shortcuts = [ ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      # hide window: disable <super>h
      minimize = [ "<Super>comma" ];
      # switch to workspace left: disable <super>left
      switch-to-workspace-left = [ ];
      # switch to workspace right: disable <super>right
      switch-to-workspace-right = [ ];
      # maximize window: disable <super>up
      maximize = [ ];
      # restore window: disable <super>down
      unmaximize = [ ];
      # move to monitor up: disable <super><shift>up
      move-to-monitor-up = [ ];
      # move to monitor down: disable <super><shift>down
      move-to-monitor-down = [ ];

      # super + direction keys, move window left and right monitors, or up and down workspaces
      # move window one monitor to the left
      move-to-monitor-left = [ ];
      # move window one workspace down
      move-to-workspace-down = [ ];
      # move window one workspace up
      move-to-workspace-up = [ ];
      # move window one monitor to the right
      move-to-monitor-right = [ ];

      # super + ctrl + direction keys, change workspaces, move focus between monitors
      # move to workspace below
      switch-to-workspace-down = [ "<Primary><Super>Down" "<Primary><Super>j" ];
      # move to workspace above
      switch-to-workspace-up = [ "<Primary><Super>Up" "<Primary><Super>k" ];
      # toggle maximization state
      toggle-maximized = [ "<Super>m" ];
      # close window
      close = [ "<Super>q" "<Alt>F4" ];

      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
    };
    "org/gnome/shell/keybindings" = {
      open-application-menu = [ ];
      # toggle message tray: disable <super>m
      toggle-message-tray = [ "<Super>v" ];
      # show the activities overview: disable <super>s
      toggle-overview = [ ];
    };
    "org/gnome/mutter/keybindings" = {
      # disable tiling to left / right of screen
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      # lock screen
      screensaver = [ "<Super>Escape" ];
      # home folder
      home = [ "<Super>f" ];
      # launch email client
      email = [ "<Super>e" ];
      # launch web browser
      www = [ "<Super>b" ];
      # rotate video lock
      rotate-video-lock-static = [ ];
      # launch terminal
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "kgx";
      name = "Launch terminal";
    };
  };

  home.packages = with pkgs; [
    pop-launcher
    gnomeExtensions.pop-shell
    gnomeExtensions.native-window-placement
  ];
}
