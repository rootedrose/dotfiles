{
  lib,
  inputs,
  ...
}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem = {config, ...}: let
    excludes = [
      "flake.lock"
      "r'.+\.age$'"
      "r'.+\.patch$'"
    ];

    mkHook = name: {
      inherit excludes;
      enable = true;
      fail_fast = true;
      verbose = true;
    };

    mkHook' = name: prev: (mkHook name) // prev;
  in {
    pre-commit = {
      check.enable = true;

      settings = {
        inherit excludes;

        hooks = {
          statix = mkHook "statix";
          deadnix = mkHook "deadnix";

          treefmt = mkHook' "treefmt" {package = config.treefmt.build.wrapper;};
          editorconfig-checker = mkHook' "editorconfig" {
            enable = lib.mkForce false;
            always_run = true;
          };

          lychee = mkHook "lychee";
        };
      };
    };
  };
}
