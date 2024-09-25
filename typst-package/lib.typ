#let vegalite = plugin("typst_vegalite.wasm")

#let eval(name) = {
  vegalite.eval(string-to-bytes(name))
}