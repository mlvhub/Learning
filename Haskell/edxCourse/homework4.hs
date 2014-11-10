square x = x * x
mySum100 = sum (map square [1..100])

sum100 = sum [x ^ 2 | x <- [1..100]]

myReplicate n a = [a | _ <- [1..n]]

factors n =
  [x | x <- [1..n], n `mod` x == 0]

pyths n =
  [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n],
  x ^ 2 + y ^ 2 == z ^ 2]

perfects n = [x | x <- [1..n], isPerfect x]
  where isPerfect num = sum (init(factors num)) == num

xs = [(x, y) | x <- [1,2,3], y <- [4,5,6]]

xs1 = [z | z <- [[(x,y) | y <- [4,5,6]] | x <- [1,2,3]]]
xs2 = concat [[[(x,y)] | x <- [1,2,3]] | y <- [4,5,6]]
--xs3 = concat [(x,y) | y <- [4,5,6]] | x <- [1,2,3]
xs4 = concat [[(x,y) | y <- [4,5,6]] | x <- [1,2,3]]
