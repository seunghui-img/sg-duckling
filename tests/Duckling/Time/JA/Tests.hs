-- Copyright (c) 2016-present, Facebook, Inc.
-- All rights reserved.
--
-- This source code is licensed under the BSD-style license found in the
-- LICENSE file in the root directory of this source tree.


module Duckling.Time.JA.Tests
  ( tests ) where

import Data.String
import Prelude
import Test.Tasty

import Duckling.Dimensions.Types
import Duckling.Testing.Asserts
import Duckling.Time.JA.Corpus

tests :: TestTree
tests = testGroup "JA Tests"
  [ makeCorpusTest [Seal Time] corpus
  , makeNegativeCorpusTest [Seal Duration] negativeCorpus
  ]
