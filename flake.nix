{ inputs = {
    templ = {
      type = "git";
      url = "https://github.com/a-h/templ";
      ref = "refs/tags/v0.2.707";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@{ self, nixpkgs, flake-utils, templ }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs { inherit system; };
        matrix-wiki = pkgs.callPackage ./package.nix { };
        docker-container = pkgs.dockerTools.buildImage {
          name = "matrix-wiki-docker";
          config = {
            Cmd = [ "${matrix-wiki}/bin/matrix-wiki" ];
          };
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.go
            templ.packages.${system}.templ
          ];
        };
        packages.default = matrix-wiki;
        packages.docker = docker-container;
      }
    );
}
