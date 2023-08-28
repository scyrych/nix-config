{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile.nvim = {
    source = "${pkgs.nvchad}";
  };
}
