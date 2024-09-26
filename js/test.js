import { render_vl_helper } from "./dist/index.js"

async function test () {
    const k = await render_vl_helper({})
    console.log(k)
}

test()
