module View exposing (view)

import Html exposing (text, Html, div, map)
import Html.Attributes exposing (class)

import Components.ArticleList as ArticleList
import Types exposing (..)


view : Model -> Html Msg
view model = div [ class "elm-app" ]
                [ map ArticleListMsg (ArticleList.view model.articleListModel) ]
