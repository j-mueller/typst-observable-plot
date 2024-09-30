{
  description = "A very basic flake";

  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, fenix, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          toolchain = fenix.packages.${system}.stable.toolchain;
          ctxjs_module_bytecode_builder = import ./nix/ctxjs-module-bytecode-builder.nix { inherit pkgs toolchain; };
        in
          {
            devShells.default = 
              pkgs.mkShell {
                name = "typst-vegalite";

                packages = with pkgs; [
                  ctxjs_module_bytecode_builder
                  typst
                  nodejs
                  closurecompiler
                ];
              };
          }
      );

}
