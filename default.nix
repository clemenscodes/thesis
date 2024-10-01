{pkgs ? import <nixpkgs> {}}:
with pkgs;
  stdenv.mkDerivation {
    name = "thesis";
    src = lib.cleanSource ./.;
    buildInputs = [
      (texlive.combine {
        inherit (texlive) scheme-full;
      })
      gnumake
    ];
    installPhase = ''
      ${gnumake}/bin/make install
      mkdir -p $out
      mv Thesis.pdf $out
    '';
  }
