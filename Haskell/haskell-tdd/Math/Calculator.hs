module Math.Calculator (
  Calculator (..)
  ,length'
  ,factors'
  ,head'
  ,last'
  ,tail'
  ,init'
  ,null'
  ,product'
  ,reverse'
  ,take'
  ,drop'
  ,fibonacci'
  ,zip'
  ,elem'
) where

data Calculator

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

factors' :: Int -> [Int]
factors' n = [x | x <- [1..n], n `mod` x == 0]

head' :: [a] -> a
head' (x:_) = x

last' :: [a] -> a
last' [a] = a
last' (_:xs) = last' xs

tail' :: [a] -> [a]
tail' (_:xs) = xs

init' :: [a] -> [a]
init' [a] = []
init' (x:xs) = x : init' xs

null' :: [a] -> Bool
null' [] = True
null' [_] = False

product' :: [Int] -> Int
product' xs = foldl (*) 1 xs

reverse' :: [a] -> [a]
reverse' [x] = [x]
reverse' (x:xs) = reverse xs ++ [x]

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' i (x:xs) = x : take' (i - 1) xs

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' i (x:xs) = drop' (i - 1) xs

fibonacci' :: Int -> Int
fibonacci' 0 = 0
fibonacci' 1 = 1
fibonacci' n = fibonacci' (n - 1) + fibonacci' (n - 2)

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' n (x:xs)
  | n == x = True
  | otherwise = elem' n xs

-- quicksort' :: (Ord a) => [a] -> [a]
