{
  description = "My First Website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
  };


  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "website";
        buildInputs = with pkgs; [
          hugo
        ];
        src = self;
      };
  };
}
