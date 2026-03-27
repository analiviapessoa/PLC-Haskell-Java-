data Tree t = Node t (Tree t) (Tree t) 
              | Nilt
              deriving (Read)

alturaArvore :: Tree t -> Int
alturaArvore Nilt = 0
alturaArvore (Node t arvore1 arvore2) = 1 + max (alturaArvore arvore1) (alturaArvore arvore2)

main = do
       a <- getLine
       let result = alturaArvore (read a::Tree Int)
       print result