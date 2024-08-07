{ inputs, ... }: {
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem = { pkgs, config, ... }: {
    formatter = config.treefmt.build.wrapper;

    treefmt = {
      projectRootFile = "flake.nix";

      programs = {
        # Nix
        nixfmt = {
          enable = true;
          package = pkgs.alejandra;
        };

        # Shell
        shellcheck.enable = true;
        shfmt = {
          enable = true;
          indent_size = 2;
        };
      };
    };
  };
}
