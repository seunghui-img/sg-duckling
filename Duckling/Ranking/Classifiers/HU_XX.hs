-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree. An additional grant
-- of patent rights can be found in the PATENTS file in the same directory.

-----------------------------------------------------------------
-- Auto-generated by regenClassifiers
--
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
--  @generated
-----------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
module Duckling.Ranking.Classifiers.HU_XX (classifiers) where
import Data.String
import Prelude
import qualified Data.HashMap.Strict as HashMap
import Duckling.Ranking.Types

classifiers :: Classifiers
classifiers
  = HashMap.fromList
      [("Thursday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.3025850929940455,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 8},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("integer (numeric)",
        Classifier{okData =
                     ClassData{prior = -0.6817184847363225, unseen = -3.828641396489095,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 44},
                   koData =
                     ClassData{prior = -0.7047080029610213,
                               unseen = -3.8066624897703196,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 43}}),
       ("pm <time-of-day>",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -3.1354942159291497,
                               likelihoods =
                                 HashMap.fromList
                                   [("time-of-day (latent)", -0.6931471805599453),
                                    ("hour", -0.6931471805599453)],
                               n = 10},
                   koData =
                     ClassData{prior = -infinity, unseen = -1.0986122886681098,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("<time> <part-of-day>",
        Classifier{okData =
                     ClassData{prior = -0.40546510810816444,
                               unseen = -3.1780538303479458,
                               likelihoods =
                                 HashMap.fromList
                                   [("dayhour", -0.9382696385929302),
                                    ("todaypart of days", -1.1895840668738362),
                                    ("tomorrowpart of days", -2.4423470353692043),
                                    ("yesterdaypart of days", -2.4423470353692043)],
                               n = 8},
                   koData =
                     ClassData{prior = -1.0986122886681098, unseen = -2.772588722239781,
                               likelihoods =
                                 HashMap.fromList
                                   [("dayhour", -1.0986122886681098),
                                    ("next <day-of-week>part of days", -2.0149030205422647),
                                    ("yyyy.mm.ddpart of days", -2.0149030205422647),
                                    ("Wednesdaypart of days", -1.6094379124341003)],
                               n = 4}}),
       ("today",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.833213344056216,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 15},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("December",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("September",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.3025850929940455,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 8},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("October",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("month (grain)",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.3862943611198906,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 2},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("January",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("Wednesday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.70805020110221,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 13},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("November",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("July",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("May",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("intersect",
        Classifier{okData =
                     ClassData{prior = -0.3629054936893685,
                               unseen = -3.8066624897703196,
                               likelihoods =
                                 HashMap.fromList
                                   [("dayhour", -1.0116009116784799),
                                    ("yyyy.mm.ddhh:mm", -3.0910424533583156),
                                    ("Wednesdaypm <time-of-day>", -2.3978952727983707),
                                    ("todaypart of days", -1.8382794848629478),
                                    ("yyyy.mm.ddpm <time-of-day>", -3.0910424533583156),
                                    ("dayminute", -3.0910424533583156),
                                    ("tomorrowpart of days", -3.0910424533583156),
                                    ("next <day-of-week>pm <time-of-day>", -2.3978952727983707),
                                    ("yesterdaypart of days", -3.0910424533583156)],
                               n = 16},
                   koData =
                     ClassData{prior = -1.1895840668738362, unseen = -3.295836866004329,
                               likelihoods =
                                 HashMap.fromList
                                   [("dayhour", -1.1786549963416462),
                                    ("next <day-of-week>part of days", -2.5649493574615367),
                                    ("Wednesdaypm <time-of-day>", -1.8718021769015913),
                                    ("yyyy.mm.ddpart of days", -2.5649493574615367),
                                    ("Wednesdaypart of days", -2.159484249353372)],
                               n = 7}}),
       ("year (grain)",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.3862943611198906,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 2},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("Saturday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.1972245773362196,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 7},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("day before yesterday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.6094379124341003,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 3},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("Monday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.1972245773362196,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 7},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("yesterday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.791759469228055,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 4},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("hh:mm:ss",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.6094379124341003,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 3},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("April",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("am <time-of-day>",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.1972245773362196,
                               likelihoods =
                                 HashMap.fromList
                                   [("time-of-day (latent)", -0.6931471805599453),
                                    ("hour", -0.6931471805599453)],
                               n = 3},
                   koData =
                     ClassData{prior = -infinity, unseen = -1.0986122886681098,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("end of month",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("Friday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.1972245773362196,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 7},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("tomorrow",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.791759469228055,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 4},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("this|last|next <cycle>",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.5649493574615367,
                               likelihoods =
                                 HashMap.fromList
                                   [("month (grain)", -1.3862943611198906),
                                    ("year (grain)", -1.3862943611198906),
                                    ("year", -1.3862943611198906), ("month", -1.3862943611198906)],
                               n = 4},
                   koData =
                     ClassData{prior = -infinity, unseen = -1.6094379124341003,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("next <day-of-week>",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.4849066497880004,
                               likelihoods =
                                 HashMap.fromList
                                   [("Thursday", -1.7047480922384253),
                                    ("Wednesday", -1.0116009116784799),
                                    ("day", -0.7884573603642702)],
                               n = 4},
                   koData =
                     ClassData{prior = -infinity, unseen = -1.3862943611198906,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("Sunday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("June",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("February",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("time-of-day (latent)",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.70805020110221,
                               likelihoods = HashMap.fromList [("integer (numeric)", 0.0)],
                               n = 13},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("hh:mm",
        Classifier{okData =
                     ClassData{prior = -0.6931471805599453, unseen = -1.791759469228055,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 4},
                   koData =
                     ClassData{prior = -0.6931471805599453, unseen = -1.791759469228055,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 4}}),
       ("March",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -3.713572066704308,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 39},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("yyyy.mm.dd",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("number (0..10)",
        Classifier{okData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0},
                   koData =
                     ClassData{prior = 0.0, unseen = -1.3862943611198906,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 2}}),
       ("Tuesday",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.9459101490553135,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 5},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("<named-month> <day-of-month> (non ordinal)",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -4.74493212836325,
                               likelihoods =
                                 HashMap.fromList
                                   [("Marchinteger (numeric)", -0.6931471805599453),
                                    ("month", -0.6931471805599453)],
                               n = 56},
                   koData =
                     ClassData{prior = -infinity, unseen = -1.0986122886681098,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("ordinal (digits)",
        Classifier{okData =
                     ClassData{prior = -2.0794415416798357,
                               unseen = -1.0986122886681098,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 1},
                   koData =
                     ClassData{prior = -0.13353139262452263,
                               unseen = -2.1972245773362196,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 7}}),
       ("seasons",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.890371757896165,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 16},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("mm.dd",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.791759469228055,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 4},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("right now",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.791759469228055,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 4},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("end of year",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.9459101490553135,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 5},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("day after tomorrow",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.6094379124341003,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 3},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("part of days",
        Classifier{okData =
                     ClassData{prior = -0.17589066646366416,
                               unseen = -3.332204510175204,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 26},
                   koData =
                     ClassData{prior = -1.824549292051046, unseen = -1.9459101490553135,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 5}}),
       ("<named-month> <day-of-month> (ordinal)",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -1.6094379124341003,
                               likelihoods =
                                 HashMap.fromList
                                   [("month", -0.6931471805599453),
                                    ("Marchordinal (digits)", -0.6931471805599453)],
                               n = 1},
                   koData =
                     ClassData{prior = -infinity, unseen = -1.0986122886681098,
                               likelihoods = HashMap.fromList [], n = 0}}),
       ("August",
        Classifier{okData =
                     ClassData{prior = 0.0, unseen = -2.0794415416798357,
                               likelihoods = HashMap.fromList [("", 0.0)], n = 6},
                   koData =
                     ClassData{prior = -infinity, unseen = -0.6931471805599453,
                               likelihoods = HashMap.fromList [], n = 0}})]