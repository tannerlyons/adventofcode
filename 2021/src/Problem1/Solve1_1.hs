import System.IO
import Data.Foldable

toTrips :: (Num a) => [a] -> [[a]]
toTrips [] = []
toTrips [x] = []
toTrips [x,y] = []
toTrips [x,y,z] = [[x,y,z]]
toTrips (x:y:z:xs) = [x,y,z]:toTrips (y:z:xs)

toPairs :: [t] -> [(t,t)]
toPairs [] = []
toPairs [x] = []
toPairs [x,y] = [(x,y)]
toPairs (x:y:xs) = (x,y):toPairs (y:xs)

isIncreasing :: (Ord a, Num a) => (a, a) -> Bool
isIncreasing (x, y) = x < y

main = do
    contents <- readFile "../Problem1/input_1.txt"
    let all = lines contents
    let tripSums = map sum (toTrips (map read all :: [Int]))
    let pairs = toPairs tripSums
    let increases = filter isIncreasing pairs
    print (length increases)