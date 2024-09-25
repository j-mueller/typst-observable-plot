{ toolchain, pkgs }: 
    let platform =
            pkgs.makeRustPlatform {
              cargo = toolchain;
              rustc = toolchain;};
    in platform.buildRustPackage rec {
            pname = "wasi-stub";
            version = "637508c184c7bfad7caadf109e2fa3871d99c57e";

            src = pkgs.fetchFromGitHub {
                owner = "astrale-sharp";
                repo = "wasm-minimal-protocol";
                rev = version;
                hash = "sha256-Qj9qrFWrib1i5lswQ9wI0y96/bROXdUmVWhoStbvDo0=";
            };

            cargoHash = "sha256-VsaNue2Jc/gwbAnixW/7NClLwFgmZYtHqvi7uI9Hq88=";

            doCheck = false;

}
