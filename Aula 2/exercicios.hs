vendas :: Int -> Int
vendas 0 = 10
vendas 1 = 20
vendas 2 = 25
vendas 3 = 10
vendas 4 = 10
vendas 5 = 25
vendas n = 0

totalVendas :: Int -> Int
totalVendas 0 = vendas 0
totalVendas n = vendas n + totalVendas (n - 1)

maxVendas :: Int -> Int
maxVendas 0 = vendas 0
maxVendas n = max (maxVendas (n-1)) (vendas n)

vendasIguaisA :: Int -> Int -> Int
vendasIguaisA s 0 | vendas 0 == s = 1
vendasIguaisA s 0 | otherwise = 0
vendasIguaisA s n | vendas n == s = 1 + vendasIguaisA s (n - 1)
vendasIguaisA s n | otherwise = vendasIguaisA s (n - 1)

------------------------------------------------------------------------

ehprimo :: Int -> Bool
ehprimo 1 = False
ehprimo n = testaPrimo (n - 1)
    where
        testaPrimo 1 = True
        testaPrimo s | mod n s == 0 = False
                     | otherwise = testaPrimo (s - 1)

primosEntreSi :: Int -> Int -> Bool
primosEntreSi v1 v2 = teste (v2 - v1)
    where 
        teste 1 = True
        teste n | mod v1 n == 0 && mod v2 n == 0 = False
                | otherwise = teste (n -1)

------------------------------------------------------------------------

fat :: Int -> Int
fat 0 = 1
fat n = n * (fat(n - 1))

allEqual :: Eq a => [a] -> Bool
allEqual [] = True
allEqual (x:xs) = all (== x) xs

all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = allEqual [a, b, c, d]

equalCount :: Int -> Int -> Int -> Int
equalCount a b c | allEqual [a, b, c] = 3
                 | allEqual [a, b] || allEqual [b, c] || allEqual [a, c] = 2
                 | otherwise = 0