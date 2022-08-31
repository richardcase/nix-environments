{
  description = "CAPA development environment";

  inputs = { 
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11"; 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.go
          pkgs.kubectl
          pkgs.kind
          pkgs.tilt
          pkgs.k9s
          pkgs.envsubst
          pkgs.dive
        ];
      };
    };
}