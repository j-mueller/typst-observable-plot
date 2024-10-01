# typst-vegalite

Run vegalite in typst. The package is published as [nulite](https://typst.app/universe/package/nulite/). See [typst-package/README.md](typst-package/README.md) for usage instructions.

## Building the project

1. Enter the nix shell with `nix develop`
2. Run `build.sh`. This compiles `js/dist/index.js` to quickjs bytecode and places it in the `typst-package` folder.
