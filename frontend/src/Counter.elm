module Counter (Model, Action, init, update, view) where

import Html
import Html.Attributes
import Html.Events

type alias Model = Int

init : Int -> Model
init = identity

type Action = Increment | Decrement

update : Action -> Model -> Model
update action model = case action of
  Increment -> model + 1
  Decrement -> model - 1

view : Signal.Address Action -> Model -> Html.Html
view address model = Html.div []
  [ Html.button [ Html.Events.onClick address Decrement ] [ Html.text "-" ]
  , Html.div [ countStyle ] [ Html.text <| toString model ]
  , Html.button [ Html.Events.onClick address Increment ] [ Html.text "+" ]
  ]

countStyle : Html.Attribute
countStyle = Html.Attributes.style
  [ ("font-size", "20px")
  , ("display", "inline-block")
  , ("width", "50px")
  , ("text-align", "center")
  ]