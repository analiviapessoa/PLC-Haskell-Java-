--Prova 2024.2
ehPrimo :: Int -> Bool
ehPrimo 1 = True
ehPrimo n = testaPrimo (n-1)
    where
        testaPrimo 1 = True
        testaPrimo x | mod n x == 0 = False
                     | otherwise = testaPrimo (x-1)

square :: [Int] -> [Int]
square [] = []
square (a:as) = a*a : square as

sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 n s = foldr (+) 0 (square (filter (ehPrimo) ([n..s])))

--com lambda
sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 n s = foldr (+) 0 (map (\x -> x * x) (filter (ehPrimo) ([n..s])))

--sem map
sumPrimeSquares1 :: Int -> Int -> Int
sumPrimeSquares1 n s = foldr (+) 0 [z * z | z <- [x..y], ehPrimo z]

--foldr1 pode gerar erro caso não haja números primos no intervalo

--folding Função -> Lista -> Inteiro
--filter Função -> Lista -> Lista