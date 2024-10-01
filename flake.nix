{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs:
    with inputs;
      flake-utils.lib.eachDefaultSystem (
        system: let
          pkgs = import nixpkgs {inherit system;};
        in
          with pkgs; {
            devShell = mkShell {
              buildInputs = [
                (texlive.combine {
                  inherit (texlive) scheme-full;
                })
                gnumake
                zotero
                moon
              ];
              shellHook = ''
                moon setup
                moon sync projects
                export MOON=$(pwd)
              '';
            };
          }
      );
}
