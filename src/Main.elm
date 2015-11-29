module Main where

import DoubleCounter
import Html
import StartApp.Simple

main : Signal.Signal Html.Html
main = StartApp.Simple.start
  { model = DoubleCounter.init 0 0
  , update = DoubleCounter.update
  , view = DoubleCounter.view
  }
