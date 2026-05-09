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
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
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
      imports = [
        inputs.emanote.flakeModule
        inputs.treefmt-nix.flakeModule
      ];
      perSystem =
        {
          self',
          pkgs,
          system,
          lib,
          ...
        }:
        {
          emanote =
            let
              ttfDir = "${pkgs.maple-mono.NF-CN}/share/fonts/truetype";
              maple-mono-fonts =
                pkgs.runCommand "maple-mono-nf-cn-woff2" { nativeBuildInputs = [ pkgs.woff2 ]; }
                  ''
                    mkdir -p $out
                    for weight in Light LightItalic SemiBold SemiBoldItalic; do
                      cp ${ttfDir}/MapleMono-NF-CN-''${weight}.ttf .
                      woff2_compress MapleMono-NF-CN-''${weight}.ttf
                      cp MapleMono-NF-CN-''${weight}.woff2 $out/
                    done
                  '';
            in
            {
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
                    {
                      path = maple-mono-fonts;
                      mountPoint = "static/fonts";
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
          treefmt = {
            programs = {
              prettier.enable = true;
              nixfmt.enable = true;
            };
            settings.formatter.prettier.excludes = [ "README.md" ];
          };
        };
    };
}
