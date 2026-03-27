contagem :: String -> Char -> Int
contagem "" caracter = 0
contagem str caracter = quant str caracter 0
    where quant "" c x = x 
          quant (a:as) c x | a == c = quant as c (x+1)
                           | otherwise = x

encode_rle :: String -> String
encode_rle "" = ""
encode_rle (a:as) = show(contagem (a:as) a) ++ [a] ++ encode_rle (drop (contagem (a:as) a) (a:as))

charToInt :: Char -> Int
charToInt ch = fromEnum ch - fromEnum '0'

mult :: Int -> Char -> String
mult quant caracter = repetir quant caracter
    where repetir 0 c = [c]
          repetir x c = c:repetir (x-1) c

decode_rle :: String -> String
decode_rle "" = ""
decode_rle (a:b:as) = (mult (charToInt a) b) ++ decode_rle as

type Dicionario = [(Int, String)]

meuDicionario :: Dicionario
meuDicionario = [(1, "casa"), (3, "cafe"), (4, "teria"), (6, "era"), (7, "uma")]
teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4" :: String
nums = ["0","1","2","3","4","5","6","7","8","9"] :: [String]

search :: Int -> Dicionario -> String
search x [] = show x
search x ((n,s):ns) | x == n = s
                    | otherwise = search x ns

decode :: Dicionario -> String -> String
decode _ [] = []
decode dict (a:as) | [a] `elem` nums = (search (read [a]) dict) ++ decode dict as
                   | otherwise = [a] ++ decode dict as

type DicionarioT = Tree Int String
data Tree chave valor = Node chave valor (Tree chave valor) (Tree chave valor)
                      | Leaf

meuDicionarioT :: DicionarioT
meuDicionarioT = Node 4 "teria" (Node 3 "cafe" (Node 1 "casa" Leaf Leaf) Leaf)
                                (Node 6 "era" Leaf (Node 7 "uma" Leaf Leaf))

dic_lista :: DicionarioT -> [(Int,String)]
dic_lista Leaf = []
dic_lista (Node c v arv1 arv2) = [(c,v)] ++ dic_lista arv1 ++ dic_lista arv2 

decodeTree :: DicionarioT -> String -> String
decodeTree _ [] = []
decodeTree dict (a:as) = decode (dic_lista dict) (a:as)