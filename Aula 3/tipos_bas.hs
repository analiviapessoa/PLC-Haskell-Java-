xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)
--ou
xor True x = not x
xor False x = x

import Data.Char
ord :: Char -> Int
chr :: Int -> Char
-- pega o código do caractere e vice-versa

offset = ord 'A' - ord 'a'
maiuscula :: Char -> Bool
maiuscula ch = chr (ord ch + offset)

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')

