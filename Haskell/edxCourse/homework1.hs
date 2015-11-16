n = a `div` length xs
  where a = 10
        xs = [1,2,3,4,5]


--last1 xs = drop (length xs - 1) xs
last2 xs = head (drop (length xs - 1) xs)
last3 xs = xs !! (length xs - 1)
last4 xs = head (reverse xs)
last5 xs = reverse xs !! (length xs - 1)


--init1 xs = tail (reverse xs)
--init2 xs = reverse (head (reverse xs))
init3 xs = reverse (tail xs)
