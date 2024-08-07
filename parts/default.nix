{ inputs, ... }: {
  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
        allowUnsupportedSystem = true;
      };
      
      overlays = [ ];
    };
  };

  systems = import inputs.systems;

  imports = [
    ./dev # Development tooling for the flake
  ];
}
