#! /bin/bash

cd js
npx npx terser dist/index.js --comporess -o dist/index.min.js
cd ..
ctxjs_module_bytecode_builder vegalite js/dist/index.min.js typst-package/vegalite.kbc1

typst compile --root=.. test/test.typ 