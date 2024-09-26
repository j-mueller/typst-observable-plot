#import "@preview/ctxjs:0.1.0"


#let vega-bytecode     = read("vega.kbc1", encoding: none)
#let vegalite-bytecode = read("vega-lite.kbc1", encoding: none)
#let vegalite-helper   = read("vegalite_helper.js", encoding: none)
#let core-js           = read("core-js.kbc1", encoding: none)
#let ctx = "@preview/vegalite"

#{
  _ = ctxjs.create-context(ctx)
  _ = ctxjs.load-module-bytecode(ctx, core-js)
  _ = ctxjs.load-module-bytecode(ctx, vega-bytecode)
  _ = ctxjs.load-module-bytecode(ctx, vegalite-bytecode)
  _ = ctxjs.load-module-js(ctx, "vegalite_helper", vegalite-helper)
}

#let render(spec) = {

  image.decode(
    ctxjs.call-module-function(
      ctx,
      "vegalite_helper",
      "render",
      (spec,)
    )
  )

}