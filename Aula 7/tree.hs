data Tree t = NilT | Node t (Tree t) (Tree t) deriving Show

arv1,arv2,arv3 :: Tree Int
arv1 = Node 4 NilT NilT
arv2 = Node 27 arv1 NilT
arv3 = Node 91 NilT arv2

depth :: Tree t -> Int
depth NilT = 0
depth (Node n arvore1 arvore2) = 1 + max (depth arvore1) (depth arvore2)

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node n arvore1 arvore2) = collapse arvore1 ++ collapse arvore2 ++ [n]

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f NilT = NilT
mapTree f (Node n arvore1 arvore2) = Node (f n) (mapTree f arvore1) (mapTree f arvore2)