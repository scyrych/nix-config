{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:
let 
  custom = fetchFromGitHub {
    repo = "nvim-config";
    owner = "scyrych";
    rev = "e71ccfadbc5b8c0009902215b39dcf102dc1d4bd";
    sha256 = "sha256-bqj2pqAb16UyJenfdM1rpmZMWct9EACqGbZkg1dB6aE=";
  };

  pname = "NvChad";
  version = "2.0.0";
  src = fetchFromGitHub {
    repo = pname;
    owner = "NvChad";
    rev = "3f1e6d71d4c6c98380d5383d5e1bf1f6eaa3399f";
    sha256 = "sha256-bqj2pqAb16UyJenfdM1rpmZMWct9EACqGbZkg1dB6aE=";
  };
in stdenv.mkDerivation rec {
  inherit pname version src;

 # dontConfigure = true;
 # dontBuild = true;
 # doCheck = false;

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
    mkdir -p "$out/lua/custom"
    cp -r ${custom}/* "$out/lua/custom/"
  '';

  meta = with lib; {
    description = "Neovim config written in lua";
    homepage = "https://github.com/NvChad/NvChad";
    license = licenses.gpl3;
  };
}
