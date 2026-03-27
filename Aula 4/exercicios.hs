-- • Quantos itens existem nas seguintes listas?
-- [2,3] [[2,3]] = 2 e 1
-- • Qual o tipo de [[2,3]]?
-- Lista de lista de inteiros
-- • Qual o resultado da avaliação de
-- [2,4..9] = [2,4,6,8]
-- [2..2] = [2]
-- [2,7..4] = [2]
-- [10,9..1] = [10,9,8,7,6,5,4,3,2,1]
-- [10..1] = []
-- [2,9,8..1] = erro
    
import Data.Char (isDigit)

double :: [Int] -> [Int]
double [] = []
double (a:as) = 2 * a : double as

member :: [Int] -> Int -> Bool
member [] x = False
member (a:as) x | a == x = True
                | otherwise = member as x

digits :: String -> String
digits "" = ""
digits str = filter isDigit str

firstDigit :: String -> char
firstDigit s = case (digits s) of
                []     -> '0'
                (a:as) -> a

sumPairs :: [(Int, Int)] -> [Int]
sumPairs [] = []
sumPairs ((a,b):as) = (a + b) : sumPairs as


