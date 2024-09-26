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
          wasi_stub = import ./nix/wasi-stub.nix { inherit pkgs toolchain; };
          ctxjs_module_bytecode_builder = import ./nix/ctxjs-module-bytecode-builder.nix { inherit pkgs toolchain; };
          wasm_target = with fenix.packages.${system}; combine [
            stable.toolchain
            targets.wasm32-wasip1.stable.rust-std
          ];
        in
          {
            devShells.default = 
              pkgs.mkShell {
                name = "typst-vegalite";

                packages = with pkgs; [
                  wasm_target
                  wasm-pack
                  wasi_stub
                  ctxjs_module_bytecode_builder
                  typst
                  nodejs
                  lld
                ];

                CARGO_TARGET_WASM32_WASIP1_LINKER = "wasm-ld";
              };
          }
      );

}
