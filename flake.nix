{
  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };

    nixpkgs-unstable = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    nixpkgs-master = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
    };

    nixpkgs-small = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable-small";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";

      inputs = {
        nixpkgs.follows = "nixpkgs-unstable";
      };
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";

      inputs = {
        nixpkgs-lib.follows = "nixpkgs-unstable";
      };
    };

    git-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";

      inputs = {
        nixpkgs.follows = "nixpkgs-small";
        nixpkgs-stable.follows = "";
        flake-compat.follows = "";
      };
    };

    lanzaboote = {
      type = "github";
      owner = "nix-community";
      repo = "lanzaboote";

      inputs = {
        nixpkgs.follows = "nixpkgs-unstable";
        flake-parts.follows = "flake-parts";
        pre-commit-hooks-nix.follows = "";
        flake-compat.follows = "";
      };
    };

    impermanence = {
      type = "github";
      owner = "nix-community";
      repo = "impermanence";
    };

    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix";

      inputs = {
        nixpkgs.follows = "nixpkgs-small";
        darwin.follows = "";
        home-manager.follows = "";
        systems.follows = "systems";
      };
    };

    arkenfox = {
      type = "github";
      owner = "dwarfmaster";
      repo = "arkenfox-nixos";

      inputs = {
        nixpkgs.follows = "nixpkgs-small";
        flake-utils.follows = "flake-utils";
        flake-compat.follows = "";
        pre-commit.follows = "";
      };
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;

      inputs = {
        systems.follows = "systems";
      };
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";

      inputs = {
        nixpkgs.follows = "nixpkgs-small";
      };
    };

    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";

      inputs = {
        systems.follows = "systems";
      };
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./parts];};
}
