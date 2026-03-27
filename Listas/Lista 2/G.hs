data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)

depth :: Tree t -> Int
depth Nilt = 0
depth (Node n arvore1 arvore2) = 1 + max (depth arvore1) (depth arvore2)

maiorDiametro :: Ord t => Tree t -> Int
maiorDiametro Nilt = 0
maiorDiametro (Node n arvore1 arvore2) = let diametroEsq = maiorDiametro arvore1 
                                             diametroDir = maiorDiametro arvore2
                                             caminho = 1 + depth arvore1 + depth arvore2
                                         in max (max diametroEsq diametroDir) caminho

main = do
    s <- getLine
    let result = maiorDiametro (read s::Tree Int)
    print result