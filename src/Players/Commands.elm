module Players.Commands exposing (..)


import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Players.Models exposing (PlayerId, Player)
import Players.Messages exposing (..)

fectchAll : Cmd Msg
fectchAll =
  Http.get collectionDecoder fectchAllUrl
    |> Task.perform FetchAllFail FetchAllDone


fectchAllUrl : String
fectchAllUrl =
  "http://localhost:4000/players"


collectionDecoder : Decode.Decoder (List Player)
collectionDecoder =
  Decode.list memberDecoder


memberDecoder : Decode.Decoder Player
memberDecoder =
  Decode.object3 Player
    ( "id" := Decode.int )
    ( "name" := Decode.string )
    ( "level" := Decode.int )
