import System.IO
import Data.Foldable

reducePairs :: (Num a) => (a, a, a) -> (String, a) -> (a, a, a)
reducePairs (curX, curY, aim) (dir, amount)
  | dir == "forward" = (curX + amount, curY + (aim * amount), aim)
  | dir == "up" = (curX, curY, aim - amount)
  | otherwise = (curX, curY, aim + amount)

toPairs :: [String] -> (String, Int)
toPairs [] = ("", 0)
toPairs [dir] = ("", 0)
toPairs (dir:amount:xs) = (dir, read amount :: Int)

main = do
    contents <- readFile "input_2.txt"
    let pairs =  map words (lines contents)
    let castedPairs = map toPairs pairs
    let (dist, depth, _) = foldl reducePairs (0, 0, 0) castedPairs
    print $ "Part 2: " ++ show (dist * depth)

    
