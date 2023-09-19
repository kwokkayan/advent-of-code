import Data.Text (pack, split, unpack)
import qualified Data.Text.Internal.Lazy as Data.Text.Internal
checkTotalOverlap :: ((Int, Int), (Int, Int)) -> Int
checkTotalOverlap ((a, b), (c, d)) = if a <= c && d <= b || c <= a && b <= d then 1 else 0

checkOverlap :: ((Int, Int), (Int, Int)) -> Int
checkOverlap ((a, b), (c, d)) = if not (c > b || d < a) then 1 else 0
toTuples s = ((head first, first !! 1), (head second, second !! 1))
    where 
        arr = map (split (=='-')) (split (==',') s)
        first = map (read . unpack) (head arr)
        second = map (read . unpack) (arr !! 1)

run = do
    contents <- readFile "./2022/day4/input.txt"
    let splitArr = split (=='\n') (pack contents)
    let arr = map toTuples splitArr
    let part1Count = sum (map checkTotalOverlap arr)
    let part2Count = sum (map checkOverlap arr)
    return (part1Count, part2Count)
-- >>> run
-- (500,815)
