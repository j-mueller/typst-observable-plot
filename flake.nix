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
          f = with fenix.packages.${system}; combine [
            stable.toolchain
            targets.wasm32-wasip1.stable.rust-std
          ];
        in
          {
            devShells.default = 
              pkgs.mkShell {
                name = "replace-me";

                packages = with pkgs; [
                  f
                ];

                CARGO_TARGET_WASM32_UNKNOWN_UNKNOWN_LINKER = "lld";
              };
          }
      );

}
