module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (map, foldl)

politely : String -> String
politely phrase =
  "Excuse me, " ++ phrase

ask : String -> String -> String
ask thing place =
  "is there a " ++ thing ++ " in a " ++ place

askPolitelyAboutFish : String -> String
askPolitelyAboutFish =
  politely << (ask "fish")

type alias Dog =
  { name : String
  , age : Int
  }

dog : Dog
dog = 
  { name = "Spock"
  , age = 3
  }

renderDogDescription : Dog -> String
renderDogDescription dog =
  dog.name ++ ", " ++ (toString dog.age)

dogs =
  [ { name = "Legolas", age  = 123 }
  , { name = "Gimli", age = 123 }
  ]

names : List Dog -> List String
names dogs =
  List.map (\dog -> dog.name) dogs

findDog : String -> List Dog -> Maybe Dog
findDog name dogs =
  List.foldl (\dog memo -> case memo of
    Just _ -> memo
    Nothing ->
      if dog.name == name then
         Just dog
         else Nothing
       ) Nothing dogs

renderDog dog =
  li []
  [ text dog.name
  , text ", "
  , b []
  [ text <| toString <| dog.age]
  ]

renderDogs dogs =
  div
  [ style
  [ ("font-family", "-apple-system")
  , ("padding", "1em")
  ]
  ]
  [ h1 [] [text "Dogs"]
  , ul [] (List.map renderDog dogs)
  ]

main =
  renderDogs dogs
