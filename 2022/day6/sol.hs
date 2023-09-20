import Data.Text (pack, split, unpack, dropEnd)

checkPacket :: String -> Int -> Int
checkPacket [] 0 = 0
checkPacket [] n = -100000 -- no need to handle this case :p
checkPacket xs n = if (checkUniqueSequence . take n) xs then n else 1 + checkPacket (tail xs) n 

checkUniqueSequence :: String -> Bool
checkUniqueSequence [] = True
checkUniqueSequence (x:xs) = notElem x xs && checkUniqueSequence xs

run = do
    contents <- readFile "./2022/day6/input.txt"
    let packet = (unpack . dropEnd 1 . pack) contents
    return (checkPacket packet 4, checkPacket packet 14)

-- >>> run 
-- (1093,3534)

