#! /bin/bash

cp js/vegalite_helper.js typst-package/
ctxjs_module_bytecode_builder core-js js/core-js.js typst-package/core-js.kbc1
ctxjs_module_bytecode_builder vega js/vega@5.30.0.js typst-package/vega.kbc1
ctxjs_module_bytecode_builder vega-lite js/vega-lite@5.21.0.js typst-package/vega-lite.kbc1

typst compile --root=. test/test.typ 