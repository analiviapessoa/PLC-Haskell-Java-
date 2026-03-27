insert :: Int -> [Int] -> [Int]
insert n [] = [n]
insert n (a:as) | n > a = a:insert n as
                | otherwise = n:a:as

ehPrimo :: Int -> Bool
ehPrimo 1 = False
ehPrimo n = calculo (n-1)
    where
        calculo 1 = True
        calculo s | mod n s == 0 = False
                  | otherwise = calculo (s-1)

sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 n s = foldr1 (+) (map (^2) (filter ehPrimo [n..s]))

sumPrimeSquares2 :: Int -> Int -> Int
sumPrimeSquares2 n s = foldr1 (+) (map (\x -> x^2) (filter ehPrimo [n..s]))

sumPrimeSquares3 :: Int -> Int -> Int
sumPrimeSquares3 n s = foldr1 (+) [ x*x | x <- [n..s], ehPrimo x]

data Tree = No Int Tree Tree | 
            Folha Int 
            deriving (Show)

calculo :: Tree -> [Int]
calculo (Folha n) = [n]
calculo (No n arv1 arv2) = calculo arv1++[n]++calculo arv2

isSorted :: Tree -> Bool
isSorted arvore = checa (calculo arvore)
    where 
        checa [x] = True
        checa (a:b:as) | a <= b = checa (b:as)
                       | otherwise = False
