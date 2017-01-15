module Types exposing (..)

import Components.ArticleList as ArticleList


type alias Model = { articleListModel : ArticleList.Model }

type Msg = ArticleListMsg ArticleList.Msg
