[1,2,3,4] :: [Int]                  --lista de inteiros
[(5,True),(7,True)] :: [(Int,Bool)] --lista de tuplas
[[4,2],[3,7,7,1],[],[9]] :: [[Int]] --lista de listas
["b","o","m"] :: [Char]
”bom” :: [Char]
--lista de caracteres = String
type String = [char]

[2..7] = [2,3,4,5,6,7]
[-1..3] = [-1,0,1,2,3]
['a'..'d'] = ['a','b','c','d']
[2.8..5.0] = [2.8,3.8,4.8]
[7,5..0] = [7,5,3,1]
[2.8,3.3..5.0] = [2.8,3.3,3.8,4.3,4.8]

head [1,2,3] = [1]
tail [1,2,3] = [2,3]

length :: [t] -> Int
length [] = 0
length (a:as) = 1 + length as

(++) :: [t] -> [t] -> [t]
[] ++ y = y
(x:xs) ++ y = x : (xs ++ y)

sumList :: [Int] -> Int
sumList [] = 0
sumList (a:as) = a + sumList as