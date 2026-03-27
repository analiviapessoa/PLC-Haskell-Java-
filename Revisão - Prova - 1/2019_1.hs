meio :: String -> Int -> Int -> String
meio "" n s = ""
meio str n s = take s (drop (n-1) str)

localizar :: String -> String -> Int
localizar s1 s2 = local s1 s2 0
    where local [] _ _ = 0
          local str1 str2 indice | str1 == ( take (length str1) str2) = (indice + 1)
                                 | tail str2 == [] = 0
                                 | otherwise = local str1 (tail str2) (indice + 1)

data Comando = ParaFrente Int
             | ParaTras Int
             | Escreva Char
             deriving (Show, Eq)

parafrente :: Int -> Int -> Int
parafrente indice frente = indice+frente

paratras :: Int -> Int -> Int
paratras indice tras = indice-tras

escreva :: String -> Char -> Int -> String
escreva str caracter indice = (take (indice-1) str) ++ [caracter] ++ drop indice str

equivalencia_pos :: String -> [Comando] -> Int -> Int
equivalencia_pos str [] indice = indice
equivalencia_pos str (ParaFrente n:as) indice = equivalencia_pos str as (parafrente indice n)
equivalencia_pos str (ParaTras n:as) indice = equivalencia_pos str as (paratras indice n)
equivalencia_pos str (Escreva c:as) indice = equivalencia_pos (escreva str c indice) as indice

posicaofinal :: String -> [Comando] -> Int 
posicaofinal str comandos = equivalencia_pos str comandos 1

equivalencia_str :: String -> [Comando] -> Int -> String
equivalencia_str str [] indice = str
equivalencia_str str (ParaFrente n:as) indice = equivalencia_str str as (parafrente indice n)
equivalencia_str str (ParaTras n:as) indice = equivalencia_str str as (paratras indice n)
equivalencia_str str (Escreva c:as) indice = equivalencia_str (escreva str c indice) as indice

interprete :: String -> [Comando] -> Char
interprete (a:as) [] = a
interprete str comandos = (equivalencia_str str comandos 1)!!(equivalencia_pos str comandos 1)

estadofinal :: String -> [Comando] -> String
estadofinal str comandos = equivalencia_str str comandos 1