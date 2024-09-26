{ toolchain, pkgs }: 
    let platform =
            pkgs.makeRustPlatform {
              cargo = toolchain;
              rustc = toolchain;};
    in platform.buildRustPackage rec {
            pname = "ctxjs";
            version = "49241de67c300cb181660c58715c12dad11b4cc2";

            src = pkgs.fetchFromGitHub {
                owner = "lublak";
                repo = "typst-ctxjs-package";
                rev = version;
                hash = "sha256-NGwwBhUMicj+5KiI1z8hleEpgyAL3rG1+cvfBhRtf3k=";
            };
            
            cargoLock = {
                lockFile = ./typst-ctxjs-cargo.lock;
            };
            # cargoHash = "sha256-D2r7InJnjeyvpWoYFFjXFxPwmY8wKuWQy9zq9qsOcdg=";

            doCheck = false;

}
