calculo :: [Int] -> [Int]
calculo (a:b:as) = a+b:calculo (b:as)

fibonacci :: [Int]
fibonacci = 0:1:(calculo fibonacci)

merge :: Ord t => [t] -> [t] -> [t]
merge [] [] = []
merge s [] = s
merge [] s = s
merge (a:as) (b:bs) | a <= b = a:merge as (b:bs)
                    | otherwise = b:merge (a:as) bs

mergesort :: Ord t => [t] -> [t]
mergesort [] = []
mergesort [x] = [x]
mergesort (a:b:as) = (merge [a] [b]) ++ mergesort as

type Pilha t = [t]
data Elemento = Valor Int | Soma | Multiplica
                deriving (Show)

exemploPilhaElem :: Pilha Elemento
exemploPilhaElem = [Valor 10, Valor 20, Soma, Valor 30, Multiplica]

gera_string :: Pilha Elemento -> String
gera_string elementos = head (foldl processa [] elementos)
    where 
        processa pilha (Valor n) = show n : pilha
        processa (a:b:as) Soma = ("(" ++ a ++ "+" ++ b ++ ")"):as
        processa (a:b:as) Multiplica = ("(" ++ a ++ "+" ++ b ++ ")"):as

calcula :: Pilha Elemento -> Int
calcula elementos = head (foldl process [] elementos)
  where
        process pilha (Valor n) = n : pilha
        process (a:b:as) Soma = (a+b) : rest
        process (a:b:as) Multiplica = (a*b) : rest
