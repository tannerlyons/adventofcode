import System.IO
import Data.List (transpose, elemIndex, intersperse)
import Data.Bits (complement)
import Data.Char(digitToInt)
import GHC.Float (divideFloat)
import Debug.Trace

reducer :: Num a => (Bool, a) -> a -> a
reducer (b, i) agg = agg + (if b then 1 else 0) * i

zipBoolArr :: [Bool] -> [(Bool, Int)]
zipBoolArr arr = zip (reverse arr) (map (2^) [0..])

bintodec :: [Bool] -> Int
bintodec arr = foldr reducer 0 (zipBoolArr arr)

charToInt :: String -> [Int]
charToInt = map digitToInt

strToBoolArry :: String -> [Bool]
strToBoolArry = map ((==1) . digitToInt)

-- genBools :: [String] -> [Bool]
-- genBools arr = map ((\n -> fromIntegral n / fromIntegral (length arr) >= 0.5) . sum . charToInt) (transpose arr)

-- genBools2 :: [String] -> Bool
-- genBools2 arr = head (map ((\n -> fromIntegral n / length arr >= 0.5) . sum . charToInt) (transpose arr))

-- scanIt :: [(String, [Bool], Int)] -> Int
-- scanIt [] = -1
-- scanIt [(str, _, _)] = bintodec (strToBoolArry str)
-- scanIt xs = scanIt (
--         map
--             (\(str, b, idx) -> (str, b, idx + 1))
--             (filter (\(str, b, idx) -> (str !! idx) == (if b !! idx then '1' else '0')) xs)
--     )

getSearchChar :: [String] -> Char
getSearchChar arr = if fromIntegral (sum (map (digitToInt . head) arr)) / fromIntegral (length arr) >= 0.5 then '0' else '1'


scanIt2 :: [(String, String)] -> String
scanIt2 [] = "0"
scanIt2 [(str, _)] = str
scanIt2 xs = do
    let srch = getSearchChar (map (\(_, c) -> c) xs)
    let filtered = filter (\(_, cur) -> head cur == srch) xs
    -- let x = intersperse "," (map (\(_,c, _) -> c) filtered); f = show
    -- trace ("calling f with x = " ++ show x) (f x)
    scanIt2 (
            map
                (\(str, cur) -> (str, drop 1 cur))
                filtered
        )

main = do
    contents <- readFile "input_3.txt"
    let allLines = lines contents
    -- print (getSearchChar (map (drop 1) allLines))
    -- let moreOnesByIndex = genBools allLines
    -- -- print moreOnesByIndex
    let toScan = map (\e -> (e, e)) allLines
    -- print toScan
    let res = scanIt2 toScan
    print ((bintodec . strToBoolArry) res)
    -- let gammaRate = bintodec moreOnesByIndex
    -- let epsilonRate = bintodec (map not moreOnesByIndex)
    -- print gammaRate
    -- print epsilonRate
    -- print (epsilonRate * gammaRate)




-- 02: 3583

