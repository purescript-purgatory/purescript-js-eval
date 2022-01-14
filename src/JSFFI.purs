module JSFFI where

foreign import foreignEval :: forall a. String -> a
