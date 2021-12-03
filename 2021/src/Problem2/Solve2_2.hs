import System.IO
import Data.Foldable

reducePairs :: (Num a) => (a, a) -> (String, a) -> (a, a)
reducePairs (curX, curY) (dir, am)
  | dir == "forward" = (curX + am, curY)
  | dir == "up" = (curX, curY - am)
  | otherwise = (curX, curY + am)

toPairs :: [String] -> (String, Int)
toPairs [] = ("", 0)
toPairs [dir] = ("", 0)
toPairs (dir:amount:xs) = (dir, read amount :: Int)

main = do
    contents <- readFile "input_2.txt"
    let (dist, depth) = foldl reducePairs (0, 0) (map (toPairs . words) (lines contents))
    print $ "Part 1: " ++ show (dist * depth)


