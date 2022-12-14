-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.


{-# LANGUAGE GADTs #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# LANGUAGE OverloadedStrings #-}

module Duckling.Time.HU.Rules
  ( rules ) where

import Data.Maybe
import Prelude
import qualified Data.Text as Text

import Duckling.Dimensions.Types
import Duckling.Numeral.Helpers (parseInt)
import Duckling.Regex.Types
import Duckling.Types
import Duckling.Time.Helpers
import qualified Duckling.Time.Types as TTime
import qualified Duckling.TimeGrain.Types as TG


ruleIntersect :: Rule
ruleIntersect = Rule
  { name = "intersect"
  , pattern =
    [ Predicate isNotLatent
    , Predicate isNotLatent
    ]
  , prod = \tokens -> case tokens of
      (Token Time td1:Token Time td2:_) -> Token Time <$> intersect td1 td2
      _ -> Nothing
  }

ruleInstants :: [Rule]
ruleInstants = mkRuleInstants
  [ ("right now",            TG.Second, 0 , "mostani(t)?|((\x00E9pp )?most)|azonnal"                      )
  , ("today",                TG.Day,    0 , "m(á|a)(i( nap(o(t|n)|it?)?|t)?|ma)?"                         )
  , ("tomorrow",             TG.Day,    1 , "holnap(i(t)?)?"                                              )
  , ("day after tomorrow",   TG.Day,    2 , "holnaput\x00E1n(i(t)?)?"                                     )
  , ("yesterday",            TG.Day,    -1, "tegnap(i(t)?)?"                                              )
  , ("day before yesterday", TG.Day,    -2, "tegnapel\x0151tt(i(t)?)?"                                    )
  , ("end of month",         TG.Month,  1 , "(a )?h\x00F3nap v\x00E9ge|h\x00F3 v\x00E9g(e|i(t)?|\x00E9n)" )
  , ("end of year",          TG.Year,   1 , "(az )?\x00E9v v\x00E9g(e|i(t)?|\x00E9n)"                     )
  ]

ruleDaysOfWeek :: [Rule]
ruleDaysOfWeek = mkRuleDaysOfWeek
  [ ( "Monday"   , "h\x00E9tf\x0151(n|t|i(t)?)?|h\x00E9t\\.?"                   )
  , ( "Tuesday"  , "kedd(en|et|i(t)?)?"                                         )
  , ( "Wednesday", "szerda(i(t)?)?|szerdá(n|t)|szer\\.?"                        )
  , ( "Thursday" , "cs\x00FCt\x00F6rt\x00F6k(\x00F6(n|t)|i(t)?)?|cs\x00FCt\\.?" )
  , ( "Friday"   , "p\x00E9ntek(e(n|t)|i(t)?)?|p\x00E9n\\.?"                    )
  , ( "Saturday" , "szombat(o(n|t)|i(t)?)?|szom\\.?"                            )
  , ( "Sunday"   , "vas\x00E1rnap(ot|i(t)?)?|vas\\.?"                           )
  ]

ruleMonths :: [Rule]
ruleMonths = mkRuleMonths
  [ ( "January"  , "janu\x00E1r(ban|i(t)?)?|jan\\.?"         )
  , ( "February" , "febru\x00E1r(ban|i(t)?)?|febr?\\.?"      )
  , ( "March"    , "m\x00E1rcius(ban|i(t)?)?|m\x00E1rc?\\.?" )
  , ( "April"    , "\x00E1prilis(ban|i(t)?)?|\x00E1pr\\.?"   )
  , ( "May"      , "m\x00E1jus(ban|i(t)?)?|m\x00E1j\\.?"     )
  , ( "June"     , "j\x00FAnius(ban|i(t)?)?|j\x00FAn\\.?"    )
  , ( "July"     , "j\x00FAlius(ban|i(t)?)?|j\x00FAl\\.?"    )
  , ( "August"   , "augusztus(ban|i(t)?)?|aug\\.?"           )
  , ( "September", "szeptember(ben|i(t)?)?|szept?\\.?"       )
  , ( "October"  , "október(ben|i(t)?)?|okt\\.?"             )
  , ( "November" , "november(ben|i(t)?)?|nov\\.?"            )
  , ( "December" , "december(ben|i(t)?)?|dec\\.?"            )
  ]

ruleMonthDOMNumeral :: Rule
ruleMonthDOMNumeral = Rule
  { name = "<named-month> <day-of-month> (non ordinal)"
  , pattern =
    [ Predicate isAMonth
    , Predicate isDOMInteger
    ]
  , prod = \tokens -> case tokens of
      (Token Time td:token:_) -> Token Time <$> intersectDOM td token
      _ -> Nothing
  }

ruleMonthDOMNumeralSuffix :: Rule
ruleMonthDOMNumeralSuffix = Rule
  { name = "<named-month> <day-of-month> (non ordinal)"
  , pattern =
    [ Predicate isAMonth
    , Predicate isDOMInteger
    , regex "(-?(jei|jén|án|én|ai|ei|je|ji|a|e|i))"
    ]
  , prod = \tokens -> case tokens of
      (Token Time td:token:_) -> Token Time <$> intersectDOM td token
      _ -> Nothing
  }

ruleMonthDOMOrdinal :: Rule
ruleMonthDOMOrdinal = Rule
  { name = "<named-month> <day-of-month> (ordinal)"
  , pattern =
    [ Predicate isAMonth
    , Predicate isDOMOrdinal
    ]
  , prod = \tokens -> case tokens of
      (Token Time td:token:_) -> Token Time <$> intersectDOM td token
      _ -> Nothing
  }

ruleCycleThisLastNext :: Rule
ruleCycleThisLastNext = Rule
  { name = "this|last|next <cycle>"
  , pattern =
    [ regex "(most|el\x0151z\x0151|m\x00FAlt|k\x00F6vetkez\x0151|j\x00F6v\x0151)"
    , dimension TimeGrain
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (match:_)):Token TimeGrain grain:_) ->
        case Text.toLower match of
          "most"                -> tt $ cycleNth grain 0
          "el\x0151z\x0151"     -> tt . cycleNth grain $ - 1
          "m\x00FAlt"           -> tt . cycleNth grain $ - 1
          "k\x00F6vetkez\x0151" -> tt $ cycleNth grain 1
          "j\x00F6v\x0151"      -> tt $ cycleNth grain 1
          _ -> Nothing
      _ -> Nothing
  }

ruleNextDOW :: Rule
ruleNextDOW = Rule
  { name = "next <day-of-week>"
  , pattern =
    [ regex "j\x00F6v\x0151"
    , Predicate isADayOfWeek
    ]
  , prod = \tokens -> case tokens of
      (_:Token Time td:_) -> tt $ predNth 1 True td
      _ -> Nothing
  }

ruleHHMM :: Rule
ruleHHMM = Rule
  { name = "hh:mm"
  , pattern =
    [ regex "((?:[01]?\\d)|(?:2[0-3]))[:.]([0-5]\\d)"
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (hh:mm:_)):_) -> do
        h <- parseInt hh
        m <- parseInt mm
        tt $ hourMinute True h m
      _ -> Nothing
  }

ruleHHMMSS :: Rule
ruleHHMMSS = Rule
  { name = "hh:mm:ss"
  , pattern =
    [ regex "((?:[01]?\\d)|(?:2[0-3]))[:.]([0-5]\\d)[:.]([0-5]\\d)"
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (hh:mm:ss:_)):_) -> do
        h <- parseInt hh
        m <- parseInt mm
        s <- parseInt ss
        tt $ hourMinuteSecond True h m s
      _ -> Nothing
  }

ruleTODLatent :: Rule
ruleTODLatent = Rule
  { name = "time-of-day (latent)"
  , pattern =
    [ Predicate $ isIntegerBetween 0 23
    ]
  , prod = \tokens -> case tokens of
      (token:_) -> do
        n <- getIntValue token
        tt . mkLatent $ hour True n
      _ -> Nothing
  }

ruleTODAM :: Rule
ruleTODAM = Rule
  { name = "am <time-of-day>"
  , pattern =
    [ regex "(de\\.?|d\x00E9lel\x0151tt)"
    , Predicate isATimeOfDay
    ]
  , prod = \tokens -> case tokens of
      (_:Token Time td:_) -> tt $ timeOfDayAMPM True td
      _ -> Nothing
  }

ruleTODPM :: Rule
ruleTODPM = Rule
  { name = "pm <time-of-day>"
  , pattern =
    [ regex "(du\\.?|d\x00E9lut\x00E1n)"
    , Predicate isATimeOfDay
    ]
  , prod = \tokens -> case tokens of
      (_:Token Time td:_) -> tt $ timeOfDayAMPM False td
      _ -> Nothing
  }

ruleYYYYMMDD :: Rule
ruleYYYYMMDD = Rule
  { name = "yyyy.mm.dd"
  , pattern =
    [ regex "(\\d{2,4})\\s?[-\\.]\\s?(0?[1-9]|1[0-2])\\s?[-\\.]\\s?(3[01]|[12]\\d|0?[1-9])"
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (yy:mm:dd:_)):_) -> do
        y <- parseInt yy
        m <- parseInt mm
        d <- parseInt dd
        tt $ yearMonthDay y m d
      _ -> Nothing
  }

ruleMMDD :: Rule
ruleMMDD = Rule
  { name = "mm.dd"
  , pattern =
    [ regex "(0?[1-9]|1[0-2])\\s?[-\\.]\\s?(3[01]|[12]\\d|0?[1-9])"
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (mm:dd:_)):_) -> do
        m <- parseInt mm
        d <- parseInt dd
        tt $ monthDay m d
      _ -> Nothing
  }

rulePartOfDays :: Rule
rulePartOfDays = Rule
  { name = "part of days"
  , pattern =
    [ regex "(reggel(i(t)?)?|d\x00E9lel\x0151tt(i(t)?)?|d\x00E9lben|d\x00E9li(t)?|d\x00E9lut\x00E1n(i(t)?)?|est(e|i(t)?)|\x00E9jszaka(i(t)?)?)"
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (match:_)):_) -> do
        let (start, end) = case Text.toLower match of
              "reggel"               -> (hour False 6, hour False 10)
              "reggeli"              -> (hour False 6, hour False 10)
              "reggelit"             -> (hour False 6, hour False 10)
              "d\x00E9lel\x0151tt"   -> (hour False 08, hour False 12)
              "d\x00E9lel\x0151tti"  -> (hour False 08, hour False 12)
              "d\x00E9lel\x0151ttit" -> (hour False 08, hour False 12)
              "d\x00E9lben"          -> (hour False 12, hour False 13)
              "d\x00E9li"            -> (hour False 12, hour False 13)
              "d\x00E9lit"           -> (hour False 12, hour False 13)
              "d\x00E9lut\x00E1n"    -> (hour False 12, hour False 18)
              "d\x00E9lut\x00E1ni"   -> (hour False 12, hour False 18)
              "d\x00E9lut\x00E1nit"  -> (hour False 12, hour False 18)
              "este"                 -> (hour False 16, hour False 20)
              "esti"                 -> (hour False 16, hour False 20)
              "estit"                -> (hour False 16, hour False 20)
              _                      -> (hour False 20, hour False 23)
        td <- interval TTime.Open start end
        tt . partOfDay $ td
      _ -> Nothing
  }

-- Since part of days are latent, general time intersection is blocked
ruleTimePOD :: Rule
ruleTimePOD = Rule
  { name = "<time> <part-of-day>"
  , pattern =
    [ dimension Time
    , Predicate isAPartOfDay
    ]
  , prod = \tokens -> case tokens of
      (Token Time td:Token Time pod:_) -> Token Time <$> intersect pod td
      _ -> Nothing
  }

ruleSeasons :: Rule
ruleSeasons = Rule
  { name = "seasons"
  , pattern =
    [ regex "(ny\x00E1r(i(t)?|on)?|\x0151sz(i(t)?)?|\x0151sszel|t\x00E9l(i(t)?|en)?|tavasz(i(t)?)?|tavasszal)"
    ]
  , prod = \tokens -> case tokens of
      (Token RegexMatch (GroupMatch (match:_)):_) -> do
        start <- case Text.toLower match of
          "ny\x00E1r"      -> Just $ monthDay 6 21
          "ny\x00E1ri"     -> Just $ monthDay 6 21
          "ny\x00E1rit"    -> Just $ monthDay 6 21
          "ny\x00E1ron"    -> Just $ monthDay 6 21
          "\x0151sz"       -> Just $ monthDay 9 23
          "\x0151szi"      -> Just $ monthDay 9 23
          "\x0151szit"     -> Just $ monthDay 9 23
          "\x0151sszel"    -> Just $ monthDay 9 23
          "t\x00E9l"       -> Just $ monthDay 12 21
          "t\x00E9li"      -> Just $ monthDay 12 21
          "t\x00E9lit"     -> Just $ monthDay 12 21
          "t\x00E9len"     -> Just $ monthDay 12 21
          "tavasz"         -> Just $ monthDay 3 20
          "tavaszi"        -> Just $ monthDay 3 20
          "tavaszit"       -> Just $ monthDay 3 20
          "tavasszal"      -> Just $ monthDay 3 20
          _ -> Nothing
        end <- case Text.toLower match of
          "ny\x00E1r"      -> Just $ monthDay 9 23
          "ny\x00E1ri"     -> Just $ monthDay 9 23
          "ny\x00E1rit"    -> Just $ monthDay 9 23
          "ny\x00E1ron"    -> Just $ monthDay 9 23
          "\x0151sz"       -> Just $ monthDay 12 21
          "\x0151szi"      -> Just $ monthDay 12 21
          "\x0151szit"     -> Just $ monthDay 12 21
          "\x0151sszel"    -> Just $ monthDay 12 21
          "t\x00E9l"       -> Just $ monthDay 3 20
          "t\x00E9li"      -> Just $ monthDay 3 20
          "t\x00E9lit"     -> Just $ monthDay 3 20
          "t\x00E9len"     -> Just $ monthDay 3 20
          "tavasz"         -> Just $ monthDay 6 21
          "tavaszi"        -> Just $ monthDay 6 21
          "tavaszit"       -> Just $ monthDay 6 21
          "tavasszal"      -> Just $ monthDay 6 21
          _ -> Nothing
        Token Time <$> interval TTime.Open start end
      _ -> Nothing

  }

rules :: [Rule]
rules =
  [ ruleIntersect
  , ruleMonthDOMNumeral
  , ruleMonthDOMNumeralSuffix
  , ruleMonthDOMOrdinal
  , ruleCycleThisLastNext
  , ruleNextDOW
  , ruleHHMM
  , ruleHHMMSS
  , ruleTODLatent
  , ruleTODAM
  , ruleTODPM
  , ruleYYYYMMDD
  , ruleMMDD
  , rulePartOfDays
  , ruleTimePOD
  , ruleSeasons
  ]
  ++ ruleInstants
  ++ ruleDaysOfWeek
  ++ ruleMonths
