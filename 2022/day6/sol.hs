import Data.Text (pack, split, unpack, dropEnd)

checkStartofPacket :: String -> Int
checkStartofPacket (a:b:c:d:xs) = if not (a == b || a == c || a == d || b == c || b == d || c == d) 
    then 4 else 1 + checkStartofPacket (b:c:d:xs)
checkStartofPacket xs = 0
-- not yet done
checkStartofMsg :: String -> Int
checkStartofMsg xs = if (checkStartofPacket . take 14) xs < 14 then 1 + (checkStartofMsg . tail) xs else 14
run = do
    contents <- readFile "./2022/day6/input.txt"
    let packet = (unpack . dropEnd 1 . pack) contents
    return (checkStartofPacket packet, checkStartofMsg packet) 

-- >>> run 
-- (1093,1093)
    
