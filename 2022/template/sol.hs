import Data.Text (pack, split, unpack)

run = do
    contents <- readFile "./2022/day4/input.txt"
    let splitArr = split (=='\n') (pack contents)
    let arr = map unpack splitArr
    return arr