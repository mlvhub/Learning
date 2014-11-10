myProduct [] = 1
myProduct (n:ns) = n * myProduct ns

factorial 0 = 1
factorial n = n * factorial (n - 1)

myLength [] = 0
myLength  (_:xs) = 1 + myLength xs

myReverse [] = []
myReverse (x:xs) = reverse xs ++ [x]

myZip _ [] = []
myZip [] _ = []
myZip (x:xs) (y:ys) = (x,y) : zip xs ys

myReplicate 0 _ = []
myReplicate n elem = [elem] ++ myReplicate (n - 1) elem

nth (x:_) 0 = x
nth (_:xs) n = nth xs (n - 1)

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem y (x:xs) = if y == x then True else myElem y xs
