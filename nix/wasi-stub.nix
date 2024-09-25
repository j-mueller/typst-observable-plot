{ toolchain, pkgs }: 
    let platform =
            pkgs.makeRustPlatform {
              cargo = toolchain;
              rustc = toolchain;};
    in platform.buildRustPackage rec {
            pname = "ripgrep";
            version = "12.1.1";

            src = pkgs.fetchFromGitHub {
                owner = "BurntSushi";
                repo = "ripgrep";
                rev = version;
                hash = "sha256-+s5RBC3XSgb8omTbUNLywZnP6jSxZBKSS1BmXOjRF8M=";
            };

            cargoHash = "sha256-l1vL2ZdtDRxSGvP0X/l3nMw8+6WF67KPutJEzUROjg8=";

            doCheck = false;

}
