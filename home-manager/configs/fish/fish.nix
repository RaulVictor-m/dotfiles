{pkgs, user, ...}:

{
  home.file.".config/fish/functions" = {
    source = ./functions;
    recursive = true;
  };

  # programs.fish.shellInit = ''
  # set -U fish_greeting
  # function nsh
  #     # Check if the user provided at least one package name
  #     if not set -q argv[1]
  #         echo "Usage: nsh <package-name> [more-packages...]"
  #         return 1
  #     end

  #     # If there are multiple packages, join them in the Nix style
  #     set pkg_names (string join " nixpkgs#" $argv)

  #     # Run the Nix command with the list of packages
  #     nix shell nixpkgs#$pkg_names
  # end

  # function ndev
  #     # Check if the user provided at least one package name
  #     if not set -q argv[1]
  #         echo "Usage: ndev <package-name> [more-packages...]"
  #         return 1
  #     end

  #     # If there are multiple packages, join them in the Nix style
  #     set pkg_names (string join " nixpkgs#" $argv)

  #     # Run the Nix command with the list of packages
  #     nix develop nixpkgs#$pkg_names
  # end

  # function nrun
  #     # Check if the user provided at least one package name
  #     if not set -q argv[1]
  #         echo "Usage: nrun <package-name>"
  #         return 1
  #     end

  #     # Run the Nix command with the list of packages
  #     nix run nixpkgs#$argv[1]
  # end

  # function nbuild
  #     # Check if the user provided at least one package name
  #     if not set -q argv[1]
  #         echo "Usage: nbuild <package-name>"
  #         return 1
  #     end

  #     # Run the Nix command with the list of packages
  #     nix build nixpkgs#$argv[1]
  # end
  # '';
}
