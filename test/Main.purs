module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log, logShow)
import JSFFI (foreignEval)

arch :: String
arch = foreignEval "require('os').arch()"

version :: String
version = foreignEval "require('os').version()"

concatenated :: String
concatenated = foreignEval "'js'+'eval'"

cpus :: Array { model :: String, speed :: Int }
cpus = foreignEval "require('os').cpus()"

main :: Effect Unit
main = do
  log concatenated
  log version
  log arch
  let speeds = (\x -> x.speed) `map` cpus
  let models = (\x -> x.model) `map` cpus
  logShow speeds
  logShow models
  pure unit
