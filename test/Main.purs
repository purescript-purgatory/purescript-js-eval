module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import JSFFI (foreignEval)

arch :: String
arch = foreignEval "require('os').arch()"

main :: Effect Unit
main = do
  log arch
