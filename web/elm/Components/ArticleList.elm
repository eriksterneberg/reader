module Components.ArticleList exposing (..)

import Http
import Debug
import Task
import Json.Decode as Json exposing (..)
import Html exposing (Html, text, ul, li, div, h2, a, button)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)

import Article

type alias Model = { articles: List Article.Model }


type alias FetchResult = Result


type Msg = NoOp
         | Fetch
         | FetchSucceed (List Article.Model)
         | FetchFail Http.Error


--articles : Model
--articles = { articles =
--               [ { title = "How to wash a dog without getting bitten"
--                 , postedBy = "Erik Sterneberg"
--                 , postedOn = "2017-01-01"
--                 , url = "https://www.google.se"}
--               , { title = "Buying flowers is harder than you think"
--                 , postedBy = "Erik Sterneberg"
--                 , postedOn = "2017-01-01"
--                 , url = "https://www.google.se"}
--               , { title = "Make love, not war"
--                 , postedBy = "Erik Sterneberg"
--                 , postedOn = "2017-01-01"
--                 , url = "https://www.google.se"}
--               ]
--           }


renderArticle : Article.Model -> Html a
renderArticle model = a [ href model.url ]
                        [ li [] [ text model.title ] ]


renderArticles: Model -> List (Html a)
renderArticles model = List.map renderArticle model.articles


update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of
    NoOp ->
        (model, Cmd.none)
    Fetch ->
        (initialModel, fetchArticles)
    FetchSucceed articleList ->
        (Model articleList, Cmd.none)
    FetchFail error ->
        case error of
            Http.BadPayload errorMessage response ->
                Debug.log errorMessage (model, Cmd.none)
            _ ->
                (model, Cmd.none)


initialModel : Model
initialModel = { articles = [] }


fetchArticles : Cmd Msg
fetchArticles = Task.attempt parseResult (Http.toTask (Http.get "/api/articles" decodeArticleData))


parseResult result = case result of
    Ok result_ -> FetchSucceed result_
    Err err_   -> FetchFail err_


decodeArticleData = field "data" (list articleDecoder)


articleDecoder: Decoder Article.Model
articleDecoder = map4 Article.Model
                    (field "title" string)
                    (field "url" string)
                    (field "posted_by" string)
                    (field "posted_on" string)


view: Model -> Html Msg
view model = div [ class "article-list"]
        [ h2 [] [ text "Article List" ]
        , button [ onClick Fetch, class "btn btn-primary" ] [ text "Fetch Articles"]
        , ul [] (renderArticles model)
        ]
