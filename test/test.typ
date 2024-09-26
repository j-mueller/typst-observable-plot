#set page(width: 200mm, height: 150mm, margin: 10mm)
#import "../typst-package/lib.typ" as vegalite

#vegalite.render(
  width: 100%,
  height: 100%,
  zoom: 1,
  json("spec.json")
  )