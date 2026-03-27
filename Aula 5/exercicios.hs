isCrescent :: (Int -> Int) -> Int -> Bool
isCrescent f 0 = True
isCrescente f n | f n > f (n-1) = isCrescent f (n-1)
                | otherwise = False
-- ou
-- isCrescent f n  | n == 0 = True
--                 | otherwise = (f n) > (f (n-1))  && isCrescent f (n-1)

square :: [Int] -> [Int]
square [] = []
square (a:as) = a*a : square as

squaresum :: [Int] -> Int
squaresum [] = 0
squaresum (a:as) = foldr1 (+) (square (a:as))

bigger :: [Int] -> [Int]
bigger [] = []
bigger (a:as) = filter (>0) (a:as)