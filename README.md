# JS Eval

> 🛸 Simple Javascript FFI using eval for Purescript

## Installation

```sh
yarn add https://github.com/rajatsharma/purescript-js-eval
npx js-eval-init
```

## Usage

```haskell
arch :: String
arch = foreignEval "require('os').arch()"
```
