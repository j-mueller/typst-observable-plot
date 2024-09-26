{ toolchain, pkgs }: 
    let platform =
            pkgs.makeRustPlatform {
              cargo = toolchain;
              rustc = toolchain;};
    in platform.buildRustPackage rec {
            pname = "ctxjs-module-bytecode-builder";
            version = "49241de67c300cb181660c58715c12dad11b4cc2";

            src = pkgs.fetchFromGitHub {
                owner = "lublak";
                repo = "typst-ctxjs-package";
                rev = version;
                hash = "sha256-Qj9qrFWrib1i5lswQ9wI0y96/bROXdUmVWhoStbvDo0=";
            };
            cargoHash = "sha256-VsaNue2Jc/gwbAnixW/7NClLwFgmZYtHqvi7uI9Hq88=";

            doCheck = false;

}
