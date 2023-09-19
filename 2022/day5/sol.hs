import Data.List (elemIndex)
import Data.Maybe (fromJust)
import Data.Text (pack, split, strip, unpack)
-- Hard to do functionally...
run = do
  contents <- readFile "./2022/day5/input.txt"
  let splitArr = split (== '\n') (pack contents)
  let arr = map unpack splitArr
  let boardIndex = fromJust (elemIndex "" arr)
  let board = take boardIndex arr
  let statements = drop (boardIndex + 1) arr
  return board

-- >>> run
-- ["            [J] [Z] [G]            ","            [Z] [T] [S] [P] [R]    ","[R]         [Q] [V] [B] [G] [J]    ","[W] [W]     [N] [L] [V] [W] [C]    ","[F] [Q]     [T] [G] [C] [T] [T] [W]","[H] [D] [W] [W] [H] [T] [R] [M] [B]","[T] [G] [T] [R] [B] [P] [B] [G] [G]","[S] [S] [B] [D] [F] [L] [Z] [N] [L]"," 1   2   3   4   5   6   7   8   9 "]
