import Data.Char

let2int :: Char -> Int
let2int c
  | isLower c = ord c - ord 'a'
  | isUpper c = ord c - ord 'A'

int2let :: Int -> Bool -> Char
int2let n upper = if upper then chr (ord 'A' + n) else chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c
  | isLower c = int2let ((let2int c + n) `mod` 26) upper
  | isUpper c = int2let ((let2int c + n) `mod` 26) upper
  | otherwise = c
  where upper = isUpper c

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]
