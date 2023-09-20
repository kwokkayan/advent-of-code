import Data.Text (pack, split, unpack)
import Data.Char (isSpace)
-- parseCommands :: [[String]] -> Int -> Bool
-- parseCommands (x:xs) size = 
--   case head x of
--     "$" -> 
--       case x !! 1 of 
--         "cd" -> if size <= 100000 then False else True 
--         "ls" -> parseCommands xs size
--     "dir" -> False
--     _ -> 
run = do
    contents <- readFile "./2022/day7/input.txt"
    let splitArr = split (=='\n') (pack contents)
    let arr = map (map unpack . split isSpace) splitArr
    return arr

-- >>> run