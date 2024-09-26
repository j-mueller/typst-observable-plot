#import "@preview/ctxjs:0.1.0"


#let vegalite-bytecode = read("vegalite.kbc1", encoding: none)
#let ctx = "@preview/vegalite"

#{
  _ = ctxjs.create-context(ctx)
  _ = ctxjs.load-module-bytecode(ctx, vegalite-bytecode)
}

#let render(spec) = {

  str(ctxjs.call-module-function(
      ctx,
      "vegalite",
      "render_vl_helper",
      (spec,)
    ))
}