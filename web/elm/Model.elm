module Model exposing (..)

import Types exposing (..)
import Components.ArticleList as ArticleList


initialModel : Model
initialModel = { articleListModel = ArticleList.initialModel }


init : (Model, Cmd Msg)
init = (initialModel, Cmd.none)
