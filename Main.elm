module Main exposing (Language, Model, Msg(..), accessLanguage, addLanguage, flagLink, init, languages, main, splashImage, update, view)

import Browser
import Browser.Navigation as Nav
import Dict exposing (get)
import Html exposing (Html, a, div, figcaption, figure, img, span, strong, text)
import Html.Attributes exposing (alt, href, id, src)
import String.Extra exposing (clean, rightOf)
import Url


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
    , key : Nav.Key
    , url : Url.Url
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model (rightOf "#" (Url.toString url)) key url, Cmd.none )



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
            ( { model | lang = rightOf "#" (Url.toString url), url = url }, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
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
            , div [ id "promo" ]
                [ a [ href "https://www.facebook.com/detblevingencd/" ]
                    [ img
                        [ id "fb-banner"
                        , src "dbic_fb_banner.png"
                        , alt "Documentary!"
                        ]
                        []
                    ]
                , div [ id "promo-links" ]
                    [ a [ href "https://www.facebook.com/watch/?v=476987502838650" ]
                        [ text "Trailer" ]
                    , a [ href "https://www.facebook.com/events/471051633657641/" ]
                        [ text "Sthlm" ]
                    , a [ href "https://www.facebook.com/events/2306265739616283/" ]
                        [ text "Gbg" ]
                    , a [ href "https://www.facebook.com/events/339391883395009/" ]
                        [ text "Malmö" ]
                    ]
                ]
            , figure []
                [ splashImage "splash.jpg"
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
