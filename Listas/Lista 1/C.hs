separar :: String -> [String]
separar [] = []
separar s = separar_lista s ""
  where
    separar_lista [] acc = [acc]
    separar_lista (a:as) acc | a == ';' = acc : separar_lista as ""
                             | otherwise = separar_lista as (acc ++ [a])

enumerar :: [String] -> [(Int, String)]
enumerar lista = zip [0..] lista

filtrar :: [String] -> [String]
filtrar [] = []
filtrar lista = [ x | (indice, x) <- enumerar lista, mod indice 3 == 2]

minMaxCartao :: String -> (Double, Double)
minMaxCartao fat = 
    let listaStrings = separar fat      
        valoresString = filtrar listaStrings
        valoresDouble = map read valoresString
        minimo = minimum valoresDouble
        maximo = maximum valoresDouble
    in (minimo, maximo)

main = do
    a <- getLine
    let result = minMaxCartao a
    print result