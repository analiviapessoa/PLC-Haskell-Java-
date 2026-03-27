--Em um sistema de controle de vendas:
-- • suponha vendas semanais dadas pela função: 
vendas :: Int -> Int
vendas n = mod n 10
-- • total de vendas da semana 0 à semana n?   (vendas 0 + vendas 1 + ... + vendas (n-1) + vendas n)
totalVendas :: Int -> Int
totalVendas n |  n == 0    = 0
              |  otherwise = vendas n + totalVendas (n - 1)
-- • Número máximo de vendas?  
maxi :: Int -> Int -> Int
maxi n m | n >= m = n
		 | otherwise = m

maxVendas :: Int -> Int
maxVendas n | n == 0    = vendas 0
            | otherwise = maxi (maxVendas (n-1)) (vendas n)