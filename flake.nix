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
          tex = pkgs.texlive.combine {inherit (pkgs.texlive) scheme-full;};
        in
          with pkgs; {
            devShell = mkShell {buildInputs = [tex gnumake zotero];};
          }
      );
}
