factors n =
  [x | x <- [1..n], n `mod` x == 0]

prime n = factors n == [1,n]

primes n = [x | x <- [2..n], prime x]

positions x xs =
  [i | (x', i) <- zip xs [0..n], x == x']
  where n = length xs - 1
