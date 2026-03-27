calculo :: [Int] -> [Int]
calculo [] = []
calculo [x] = [x]
calculo (a:b:as) = a+b:calculo (b:as)

fibonacci :: [Int]
fibonacci = 0:1:calculo fibonacci

merge :: Ord t => [t] -> [t] -> [t]
merge [] [] = []
merge [] _ = _
merge _ [] = _
merge (a:as) (b:bs) | a>=b = 