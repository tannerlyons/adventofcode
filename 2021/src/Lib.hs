module Lib
    (
        toPairs,
        ifIncreasingThen1Else0
    ) where

toPairs :: [t] -> [(t,t)]
toPairs [] = []
toPairs [x] = []
toPairs [x,y] = [(x,y)]
toPairs (x:y:xs) = (x,y):toPairs (y:xs)

ifIncreasingThen1Else0 :: (Ord a, Num a) => (a, a) -> a
ifIncreasingThen1Else0 (x, y) = if x < y then 1 else 0
