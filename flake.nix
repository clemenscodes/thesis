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
        in {
          packages = {
            default = import ./default.nix {inherit pkgs;};
          };
          devShell = import ./shell.nix {inherit pkgs;};
        }
      );
}
