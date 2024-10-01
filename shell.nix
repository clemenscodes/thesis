{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
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
  }
