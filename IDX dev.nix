# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11"; # "stable-23.11" or "unstable"
  services.docker.enable = true;
  # Use https://search.nixos.org/packages to  find packages
  packages = [
    pkgs.python311
    pkgs.python311Packages.pip
  ];
  # Sets environment variables in the workspace
  env = { };
  idx = {
    # search for the extension on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "ms-toolsai.jupyter"
      "ms-python.python"
      "mhutchie.git-graph"
      "ms-azuretools.vscode-docker"
    ];
    workspace = {
      # runs when a workspace is first created with this `dev.nix` file
      # to run something each time the environment is rebuilt, use the `onStart` hook
      onCreate = {
        create-venv = ''
          python -m venv .venv
          source .venv/bin/activate
          pip install -r requirements.txt
        '';
      };
    };
    # preview configuration, identical to monospace.json
    previews = {
    };
  };
}
