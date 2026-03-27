import Data.Char

type Chave = [(Char, Char)]

letras :: [Char]
letras = ['A'..'Z']

calculo :: Int -> [Char] -> [Char]
calculo n [] = []
calculo n (a:as) | ((ord a) + n) > 90 = (chr ((ord 'A') + ((ord a)+n)-91)):calculo n as
                 | otherwise = (chr ((ord a) + n)):calculo n as

cria_chave :: Int -> Chave
cria_chave n = zip letras (calculo n letras)

search :: Chave -> Char -> Char
search [] a = a
search ((antigo,novo):resto) a | antigo == a = novo
                               | otherwise = search resto a

crypt :: Chave -> String -> String
crypt chaves [] = []
crypt chaves (a:as) = (search chaves a) : crypt chaves as

data ChaveTree = Node Char Char ChaveTree ChaveTree
               | Leaf
               deriving (Show) 

chave_Parcial :: ChaveTree
chave_Parcial = Node 'I' 'L' (Node 'A' 'D' Leaf Leaf)
                             (Node 'L' 'O' Leaf Leaf)
                  
ctree_to_chave :: ChaveTree -> Chave
ctree_to_chave Leaf = []
ctree_to_chave (Node c1 c2 arv1 arv2) = ctree_to_chave arv1++zip [c1] [c2]++ctree_to_chave arv2

cryptT :: ChaveTree -> String -> String
cryptT arvore str = crypt (ctree_to_chave arvore) str