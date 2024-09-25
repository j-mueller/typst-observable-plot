use wasm_minimal_protocol::*;

initiate_protocol!();

#[wasm_func]
fn eval(_name: &[u8]) -> Result<Vec<u8>, String> {
    let result = "HELLO";
    return Ok(result.as_bytes().to_vec())
}