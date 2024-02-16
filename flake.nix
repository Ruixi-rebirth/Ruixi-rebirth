{
  inputs = {
    emanote.url = "github:srid/emanote";
    nixpkgs.follows = "emanote/nixpkgs";
    flake-parts.follows = "emanote/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    flake-root.url = "github:srid/flake-root";
  };

  outputs = inputs@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [
        inputs.emanote.flakeModule
        inputs.treefmt-nix.flakeModule
        inputs.flake-root.flakeModule
      ];
      perSystem = { self', pkgs, system, config, ... }: {
        treefmt.config = {
          inherit (config.flake-root) projectRootFile;
          package = pkgs.treefmt;
          programs.nixpkgs-fmt.enable = true;
          programs.prettier.enable = true;
        };

        emanote = {
          sites."default" = {
            layers = [ ./. ];
            layersString = [ "." ];
            port = 7000;
            baseUrl = "/"; # Change to "/" (or remove it entirely) if using CNAME
            prettyUrls = true;
          };
        };
        devShells.default = pkgs.mkShell {
          buildInputs = [
            inputs.emanote.packages.${pkgs.system}.emanote
          ];
        };
        formatter = config.treefmt.build.wrapper;
      };
    };
}
