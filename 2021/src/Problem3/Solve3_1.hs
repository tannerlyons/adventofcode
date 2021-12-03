import System.IO
import Data.List (transpose)
import Data.Bits (complement)
import Data.Char(digitToInt)
import GHC.Float (divideFloat)

reducer :: Num a => (Bool, a) -> a -> a
reducer (b, i) agg = agg + ((if b then 1 else 0) * i)

zipBoolArr :: [Bool] -> [(Bool, Int)]
zipBoolArr arr = zip (reverse arr) (map (2^) [0..])

bintodec :: [Bool] -> Int
bintodec arr = foldr reducer 0 (zipBoolArr arr)

charToInt :: String -> [Int]
charToInt = map digitToInt

-- 3071834 is too low.
-- 1535917 is too low.

main = do
    -- print (zipBoolArr [True, False, True, True, False])
    -- print (bintodec [True, False, True, True, False])
    -- print (map (reducer 0) (zipBoolArr [True, False, True, True, False]))
    contents <- readFile "input_3.txt"
    let allLines = lines contents
    let len = length allLines
    let indexGroups = transpose allLines
    let sums = map charToInt indexGroups
    let numOnes = map sum sums
    let moreOnesByIndex = map (\n -> fromIntegral n / fromIntegral len >= 0.5) numOnes
    print moreOnesByIndex
    let gammaRate = bintodec moreOnesByIndex
    let epsilonRate = bintodec (map not moreOnesByIndex)
    print gammaRate
    print epsilonRate
    print (epsilonRate * gammaRate)






