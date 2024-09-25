#let vegalite = plugin("typst_vegalite.wasm")

#let string-to-bytes(data) = {
  let data = data
  if type(data) == str {
    data = bytes(data)
  } else if type(data) == array {
    data = bytes(data)
  } else if type(data) == content {
    data = bytes(data.text)
  }
  data
}
#let eval(name) = {
 str(vegalite.eval(string-to-bytes(name)))
}