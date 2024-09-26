#set page(width: 200mm, height: 150mm, margin: 10mm)
#import "../typst-package/lib.typ" as vegalite

#let spec = json("spec.json")
#vegalite.render(spec)