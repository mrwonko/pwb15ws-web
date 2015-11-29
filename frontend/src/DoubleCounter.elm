module DoubleCounter where

import Html
import Html.Events

import Counter

type alias Model =
  { topCounter : Counter.Model
  , bottomCounter : Counter.Model
  }

init : Int -> Int -> Model
init top bottom =
  { topCounter = Counter.init top
  , bottomCounter = Counter.init bottom
  }

type Action = Reset | Top Counter.Action | Bottom Counter.Action

update : Action -> Model -> Model
update action model = case action of
  Reset -> init 0 0
  Top act -> { model | topCounter = Counter.update act model.topCounter }
  Bottom act -> { model | bottomCounter = Counter.update act model.bottomCounter }

view : Signal.Address Action -> Model -> Html.Html
view address model = Html.div []
  [ Counter.view (Signal.forwardTo address Top) model.topCounter
  , Counter.view (Signal.forwardTo address Bottom) model.bottomCounter
  , Html.button [ Html.Events.onClick address Reset ] [ Html.text "Reset" ]
  ]
