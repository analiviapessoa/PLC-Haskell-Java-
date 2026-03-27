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
totalVendas n = totalVendas (n-1) + vendas n

mediaVendas :: Int -> Float
mediaVendas 0 = 0
mediaVendas n = (fromIntegral(totalVendas n))/(fromIntegral(n+1))

addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos (n-1)

paraDireita :: Int -> String -> String
paraDireita n s = addEspacos n ++ s

cabecalho :: String
cabecalho = "Semana" ++ paraDireita 2 "Venda" ++ "\n"

imprimeSemanas :: Int -> String
imprimeSemanas 0 = paraDireita 2 "0" ++ paraDireita 5 (show(vendas 0)) ++ "\n"
imprimeSemanas n = imprimeSemanas(n-1) ++ paraDireita 2 (show n) ++ paraDireita 5 (show(vendas n)) ++ "\n"

imprimeTotal :: Int -> String
imprimeTotal n = "Total" ++ paraDireita 3 (show(totalVendas n)) ++ "\n"

imprimeMedia :: Int -> String
imprimeMedia n = "Média" ++ paraDireita 3 (show (mediaVendas n)) ++ "\n"

imprimeTabela :: Int -> IO()
imprimeTabela n = putStr(cabecalho
                ++ imprimeSemanas n
                ++ imprimeTotal n
                ++ imprimeMedia n)