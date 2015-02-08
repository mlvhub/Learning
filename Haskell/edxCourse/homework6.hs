double x = x + x

map1 f = foldr (\ x xs -> xs ++ [f x]) []
map2 f = foldr (\ x xs -> f x ++ xs) []
map3 f = foldl (\ xs x -> f x : xs) []
map4 f = foldl (\ xs x -> xs ++ [f x]) []

filter1 p = foldl (\ xs x -> if p x then x : xs else xs) []
filter2 p = foldr (\ x xs -> if p x then x : xs else xs) []

dec2int1 = foldr (\ x y -> 10 * x + y) 0
dec2int2 = foldl (\ x y -> x + 10 * y) 0
dec2int3 = foldl (\ x y -> 10 * x + y) 0

myCompose = foldr (.) id
sumsqreven = myCompose [sum, map (^ 2), filter even]

curry3 f = \ x y -> f (x, y)
