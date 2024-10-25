# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs ? import <nixpkgs> {} }: {
  # Specify the nixpkgs channel
  channel = "stable-24.05"; 

  # Define required packages
  packages = [
    pkgs.python3
    (pkgs.python3.withPackages(ps: [ps.pip ps.mkdocs ps.mkdocs-material])) # Define packages here
  ];

  # Environment variables (if any)
  env = {};

  # IDX settings (previews and extensions)
  idx = {
    extensions = [];
    previews = {
      enable = true;
      previews = {};
    };
    workspace = {
      onCreate = {
        default.openFiles = [ ".idx/dev.nix" "README.md" ];
      };
      onStart = {};
    };
  };
}

