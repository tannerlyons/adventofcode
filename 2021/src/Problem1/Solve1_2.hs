import System.IO
import Data.Foldable

toPairs :: [t] -> [(t,t)]
toPairs [] = []
toPairs [x] = []
toPairs [x,y] = [(x,y)]
toPairs (x:y:xs) = (x,y):toPairs (y:xs)

ifIncreasingThen1Else0 :: (Ord a, Num a) => (a, a) -> a
ifIncreasingThen1Else0 (x, y) = if x < y then 1 else 0

main = do
    contents <- readFile "input_1.txt"
    let all = lines contents
    let pairs = toPairs (map read all :: [Int])
    let descends = map ifIncreasingThen1Else0 pairs
    print (sum descends)