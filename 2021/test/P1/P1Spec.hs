module P1.P1Spec (spec) where

import Test.Hspec
import Lib (incr)

spec :: Spec
spec = do
  describe "incr" $ do
    it "can add 1" $ do
      incr  1 `shouldBe` 2
