module Math.Problems (
  Problems (..)
  ,NestedList(Elem, List)
  ,last'
  ,butLast'
  ,elementAt'
  ,length'
  ,reverse'
  ,isPalindrome'
  ,flatten'
  ,compress'
  ,pack'
  ,encode'
  ,encodePack'
) where

data Problems

last' :: [a] -> a
last' [x] = x
last' (_:xs) = last' xs

butLast' :: [a] -> a
butLast' [x, _] = x
butLast' (x:xs) = butLast' xs

elementAt' :: [a] -> Int -> a
elementAt' (x:_) 1 = x
elementAt' (_:xs) i = elementAt' xs (i - 1)

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

isPalindrome' :: (Eq a) => [a] -> Bool
isPalindrome' xs = xs == reverse' xs

data NestedList a = Elem a | List [NestedList a]
flatten' :: NestedList a -> [a]
flatten' (Elem x) = [x]
flatten' (List x) = concatMap flatten' x

compress' :: (Eq a) => [a] -> [a]
compress' [] = []
compress' [x] = [x]
compress' (x:y:zs)
  | x == y = compress' (y:zs)
  | otherwise = x : compress' (y:zs)

pack' :: (Eq a) => [a] -> [[a]]
pack' [] = []
pack' (x:xs) = impl xs [[x]]
  where
    impl [] packed = packed
    impl (x:xs) packed
      | x == (head (last packed)) = impl xs ((init packed) ++ [x:(last packed)])
      | otherwise = impl xs (packed ++ [[x]])

encode' :: (Eq a) => [a] -> [(Int, a)]
encode' xs = impl (pack' xs)
  where
    impl [] = []
    impl (x:xs) = (length' x, head x) : impl xs

encodePack' :: (Eq a) => [a] -> [(Int, a)]
encodePack' xs = map (\x -> (length x,head x)) (pack' xs)
