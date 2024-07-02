{
  # General dev shell config, to be used with "nixdev".
  # For the future, I can create a script that initializes
  # such a flake in any dir, and create more specific environments
  # similarly to docker.
  description = "Jay's dev shell configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            # Packages in shell
            nativeBuildInputs = with pkgs; [
              ruby_3_3
            ];

            # On shell start
            shellHook = ''
              export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
              export PATH="$PATH:$GEM_HOME/bin"

              echo "Welcome to Jay's dev shell."
            '';
          };
    };
}

