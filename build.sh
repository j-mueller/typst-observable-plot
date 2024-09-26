#! /bin/bash

ctxjs_module_bytecode_builder vegalite js/dist/index.js typst-package/vegalite.kbc1

typst compile --root=.. test/test.typ 