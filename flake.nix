{
  nixConfig = {
    extra-substituters = "https://cache.nixos.asia/oss";
    extra-trusted-public-keys = "oss:KO872wNJkCDgmGN3xy9dT89WAhvv13EiKncTtHDItVU=";
  };

  inputs = {
    emanote.url = "github:srid/emanote";
    emanote.inputs.emanote-template.follows = "";
    nixpkgs.follows = "emanote/nixpkgs";
    flake-parts.follows = "emanote/flake-parts";
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      nixpkgs,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.emanote.flakeModule ];
      perSystem =
        {
          self',
          pkgs,
          system,
          lib,
          ...
        }:
        {
          emanote = {
            # By default, the 'emanote' flake input is used.
            # package = inputs.emanote.packages.${system}.default;
            sites = rec {
              # For available options, see:
              # https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/default.nix
              default = {
                layers = [
                  {
                    path = ./.; # Nix store path, used by `nix build`
                    # HACK (upstream): `path` gets copied to Nix store, so toString gives
                    # a store path. `pathString` overrides it with the real local path for
                    # `nix run` (live server) to enable hot reload and .emanoteignore.
                    # cf. https://discourse.nixos.org/t/converting-from-types-path-to-types-str/19405
                    pathString = ".";
                  }
                ];
                port = 7001;
              };
              # Fallback for deploying without a custom domain (e.g. if ruixi2fp.top expires)
              github-io = default // {
                check = false;
                extraConfig.template.baseUrl = "/Ruixi-rebirth/"; # GitHub Pages sub-path
              };
            };
          };
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.nixpkgs-fmt
            ];
          };
          formatter = pkgs.nixpkgs-fmt;
        };
    };
}
