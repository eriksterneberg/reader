module Update exposing (update, subscriptions)

import Types exposing (..)
import Components.ArticleList as ArticleList


update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
    ArticleListMsg articleMsg ->
        let (updatedModel, cmd) = ArticleList.update articleMsg model.articleListModel
        in ( { model | articleListModel = updatedModel }, Cmd.map ArticleListMsg cmd )        


subscriptions : Model -> Sub Msg
subscriptions model = Sub.none
