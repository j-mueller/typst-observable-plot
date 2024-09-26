import { nodeResolve } from '@rollup/plugin-node-resolve';
import json from '@rollup/plugin-json';
import inject from '@rollup/plugin-inject';

export default {
  input: 'src/index.js',
  output: {
    dir: 'dist',
    format: 'es'
  },
  plugins:
    [ nodeResolve()
      , json()
      , inject({
        structuredClone: "@ungap/structured-clone"
      })
    ]
};