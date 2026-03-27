insere :: String -> [String] -> [String]
insere str [] = [str]
insere str (a:as) | str <= a = str:a:as
                  | otherwise = a:insere str as

bSort :: [String] -> [String]
bSort = foldr insere []

main = do
    a <- getLine
    let result = bSort (read a :: [String])
    print result