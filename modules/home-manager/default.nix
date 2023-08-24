# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  theming = import ./theming.nix;
  gnomeExtensions = import ./gnomeExtensions.nix;
  pop-shell = import ./pop-shell.nix;
}
