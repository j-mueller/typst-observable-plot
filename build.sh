#! /bin/bash

cargo build --release --target wasm32-wasip1
wasi-stub -r 0 ./target/wasm32-wasip1/release/typst_vegalite.wasm -o typst-package/typst_vegalite.wasm

typst compile --root=. test/test.typ 