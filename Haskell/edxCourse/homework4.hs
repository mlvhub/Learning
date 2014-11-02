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
