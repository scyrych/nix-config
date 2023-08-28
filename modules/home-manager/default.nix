# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  alacritty = import ./alacritty;
  gnomeExtensions = import ./gnomeExtensions.nix;
  nvim = import ./nvim.nix;
  pop-shell = import ./pop-shell.nix;
  theming = import ./theming.nix;
  zsh = import ./zsh;
}
