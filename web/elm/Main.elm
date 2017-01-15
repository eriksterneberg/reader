module Main exposing (..)

import Html exposing (program)

import Model
import View
import Update


--main : Program Never Model Msg
main = program { init = Model.init
               , view = View.view
               , update = Update.update
               , subscriptions = Update.subscriptions
               }
