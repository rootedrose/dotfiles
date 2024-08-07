{
  perSystem = {
    inputs',
    config,
    pkgs,
    ...
  }: {
    devShells = {
      default = pkgs.mkShellNoCC {
        shellHook = config.pre-commit.installationScript;

        DIRENV_LOG_FORMAT = "";

        packages = [
          pkgs.git
          pkgs.nix-output-monitor
          inputs'.agenix.packages.agenix
        ];
      };
    };
  };
}
