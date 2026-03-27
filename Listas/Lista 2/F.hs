equivalenciaDouble :: String -> Double
equivalenciaDouble "A+" = 9.7
equivalenciaDouble "A" = 9.3
equivalenciaDouble "A-" = 9.0
equivalenciaDouble "B+" = 8.7
equivalenciaDouble "B" = 8.3
equivalenciaDouble "B-" = 8.0
equivalenciaDouble "C+" = 7.7
equivalenciaDouble "C" = 7.3
equivalenciaDouble "C-" = 7.0
equivalenciaDouble "D+" = 6.7
equivalenciaDouble "D" = 6.3
equivalenciaDouble "D-" = 6.0
equivalenciaDouble "F" = 5.9

equivalenciaString :: Double -> String
equivalenciaString x | x >= 9.7 = "A+"
                     | x >= 9.3 && x < 9.7 = "A"
                     | x >= 9.0 && x < 9.3 = "A-"
                     | x >= 8.7 && x < 9.0 = "B+"
                     | x >= 8.3 && x < 8.7 = "B"
                     | x >= 8.0 && x < 8.3 = "B-"
                     | x >= 7.7 && x < 8.0 = "C+"
                     | x >= 7.3 && x < 7.7 = "C"
                     | x >= 7.0 && x < 7.3 = "C-"
                     | x >= 6.7 && x < 7.0 = "D+"
                     | x >= 6.3 && x < 6.7 = "D"
                     | x >= 6.0 && x < 6.3 = "D-"
                     | x < 6 = "F"

conversaoDouble :: [String] -> [Double]
conversaoDouble [] = []
conversaoDouble (a:as) = (equivalenciaDouble a):(conversaoDouble as)

calmedia :: [Double] -> Double
calmedia [] = 0
calmedia (a:as) = sum(a:as)/fromIntegral(length(a:as))

comparar :: Double -> [Double] -> [Double]
comparar x [] = []
comparar x (a:as) | x >= a = x:comparar x as
                  | otherwise = comparar x as

contagemNotas :: [String] -> [String] -> Int
contagemNotas [] [] = 0
contagemNotas _ [] = 0
contagemNotas [] _ = 0
contagemNotas (a:as) (b:bs) = length(comparar (calmedia(conversaoDouble(a:as))) (conversaoDouble(b:bs)))

main = do
    a <- getLine
    b <- getLine
    print (contagemNotas (read a) (read b))
