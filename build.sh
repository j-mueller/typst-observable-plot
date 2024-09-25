#! /bin/bash

cargo build --release --target wasm32-wasip1
cp target/wasm32-wasip1/release/typst_vegalite.wasm typst-package/typst_vegalite.wasm

typst compile --root=. test/test.typ 