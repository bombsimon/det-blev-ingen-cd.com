module Main exposing (Language, Model, Msg(..), accessLanguage, addLanguage, flagLink, init, languages, main, splashImage, update, view)

import Browser
import Browser.Navigation as Nav
import Dict exposing (get)
import Html exposing (Html, a, div, figcaption, figure, img, span, strong, text)
import Html.Attributes exposing (alt, href, id, src)
import String.Extra exposing (clean, rightOf)
import Url
import Url.Parser as Parser
import Url.Parser.Query as Query


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- LANGUAGE


type alias Language =
    { lead : String
    , full : String
    }


addLanguage : String -> String -> Language
addLanguage lead full =
    Language lead full


accessLanguage : Maybe Language -> Language
accessLanguage l =
    case l of
        Just language ->
            language

        Nothing ->
            Dict.get "se" languages
                |> accessLanguage


languages =
    Dict.fromList
        [ ( "se"
          , addLanguage
                "Det blev ingen cd."
                ("""Några 15-åringar från Domarhagsskolan tänkte kolla in
                cd-skivor under lunchrasten. Men affären de gick till hade
                stängt. Från vänster står Alfredo Pettersson, Richard Knöös,
                Tommy Carlberg, Mattias Persson och Max Malmström."""
                    |> clean
                )
          )
        , ( "dk"
          , addLanguage
                "Der blev ingen cd."
                ("""Nogle 15-årige drenge fra Domarhagsskolen tænkte at se på
                nogle cd'er i frokostpausen. Men butikken de gik til var lukket.
                Fra venstre står Alfredo Pettersson, Richard Knöos, Tommy
                Carlberg, Mattias Persson og Max Malmström."""
                    |> clean
                )
          )
        , ( "us"
          , addLanguage
                "They didn't get any cd."
                ("""A few 15 year old boys from Domarhagsskolan were going to
                check out CD's during the lunch break. But the store they went
                to was closed. Standing from the left; Alfredo Pettersson,
                Richard Knöös, Tommy Carlberg, Mattias Persson and Max
                Malmström."""
                    |> clean
                )
          )
        , ( "de"
          , addLanguage
                "Sie erhielten kein cd."
                ("""Einige 15 jahre alte jungen von Domarhagsskolan waren im
                begriff, aus CD's während der mittagspause zu überprüfen. Aber
                der speicher gingen sie zu waren geschlossen. Stehen vom links;
                Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias
                Persson und Max Malmström."""
                    |> clean
                )
          )
        , ( "fr"
          , addLanguage
                "Ils n'ont obtenu aucun cd."
                ("""Quelques 15 années de garçons de Domarhagsskolan allaient
                vérifier CD's pendant la pause de midi. Mais le magasin elles
                sont allées à étaient fermées. Se tenir de la gauche ; Alfredo
                Pettersson, Richard Knöös, Tommy Carlberg, Mattias Persson, Max
                Malmström."""
                    |> clean
                )
          )
        , ( "es"
          , addLanguage
                "No consiguieron ningún cd."
                ("""Algunos 15 años de viejos muchachos de Domarhagsskolan iban a
                comprobar fuera de CD's durante la hora de la almuerzo. Pero el
                almacén fueron a eran cerrados. El estar parado de la izquierda;
                Alfredo Pettersson, Richard Knöös, Tommy Carlberg, Mattias
                Persson y Max Malmström."""
                    |> clean
                )
          )
        ]



-- MODEL


type alias Model =
    { lang : String
    , hd : Bool
    , key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        language =
            rightOf "#" (Url.toString url)

        hd =
            isHD <| url
    in
    ( Model language hd key url, Cmd.none )


isHD : Url.Url -> Bool
isHD url =
    let
        parsedQueryString =
            Parser.parse (Parser.query queryString) <| stripPath <| url
    in
    case parsedQueryString of
        Just (Just v) ->
            v

        _ ->
            False


queryString : Query.Parser (Maybe Bool)
queryString =
    Query.enum "hd" (Dict.fromList [ ( "true", True ), ( "false", False ) ])


stripPath : Url.Url -> Url.Url
stripPath url =
    { url | path = "" }



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            let
                lang =
                    rightOf "#" (Url.toString url)

                hd =
                    isHD <| url
            in
            ( { model | lang = lang, hd = hd, url = url }, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        splashImagePath =
            case model.hd of
                True ->
                    "splash_hd.jpg"

                False ->
                    "splash.jpg"

        currentLang =
            Dict.get model.lang languages
                |> accessLanguage
    in
    { title = currentLang.lead
    , body =
        [ div [ id "wrapper" ]
            [ a [ href "https://github.com/bombsimon/det-blev-ingen-cd.com" ]
                [ img
                    [ id "github-ribbon"
                    , src "https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png"
                    , alt "Fork me on GitHub!"
                    ]
                    []
                ]
            , div [ id "top-space" ]
                [ div [ id "top-space-links" ]
                    [ a [ href ("?hd=true#" ++ model.lang) ]
                        [ text "HD" ]
                    , a [ href ("?hd=false#" ++ model.lang) ]
                        [ text "NOHD" ]
                    ]
                ]
            , figure []
                [ splashImage splashImagePath
                , div [ id "flags" ]
                    [ flagLink "se"
                    , flagLink "dk"
                    , flagLink "us"
                    , flagLink "de"
                    , flagLink "fr"
                    , flagLink "es"
                    ]
                , figcaption [ id "text " ]
                    [ strong [ id "lead" ] [ text currentLang.lead ]
                    , span [ id "separator" ] [ text " " ]
                    , span [ id "full" ] [ text currentLang.full ]
                    ]
                ]
            ]
        ]
    }


splashImage : String -> Html Msg
splashImage source =
    img [ src source, id "splash", alt "" ] []


flagLink : String -> Html Msg
flagLink lang =
    a [ id lang, href ("#" ++ lang) ]
        [ img [ src ("flags/" ++ lang ++ ".png") ] []
        ]
