separar :: String -> [String]
separar [] = []
separar s = separar_lista s ""
  where
    separar_lista [] acc = [acc]
    separar_lista (a:as) acc | a == ';' = acc : separar_lista as ""
                             | otherwise = separar_lista as (acc ++ [a])

enumerar :: [String] -> [(Int, String)]
enumerar lista = zip [0..] lista

valoresMes :: String -> [String] -> [Double]
valoresMes mes lista = [read (lista !! (indice + 2)) | (indice, data_mes) <- enumerar lista, 
                                                                         mod indice 3 == 0,  
                                                                         mes `elem` words data_mes,  
                                                                         (indice + 2) < length lista]  

logMes :: String -> String -> Double
logMes mes fatura = 
    let listaStrings = separar fatura
        valoresdoMes = valoresMes mes listaStrings
    in sum valoresdoMes

main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result