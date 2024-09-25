{ toolchain, pkgs }: 
    let platform =
            pkgs.makeRustPlatform {
              cargo = toolchain;
              rustc = toolchain;};
    in platform.buildRustPackage rec {
            pname = "ripgrep";
            version = "12.1.1";

            src = fetchFromGitHub {
                owner = "BurntSushi";
                repo = "ripgrep";
                rev = version;
                hash = "sha256-+s5RBC3XSgb8omTbUNLywZnP6jSxZBKSS1BmXOjRF8M=";
            };

            cargoHash = "sha256-l1vL2ZdtDRxSGvP0X/l3nMw8+6WF67KPutJEzUROjg8=";

            doCheck = false;

            meta = with lib; {
                description = "A fast line-oriented regex search tool, similar to ag and ack";
                homepage = "https://github.com/BurntSushi/ripgrep";
                license = with licenses; [ mit unlicense ];
                maintainers = with maintainers; [];
            };
}
