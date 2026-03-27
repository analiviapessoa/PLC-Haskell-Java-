btoi :: String -> Int
btoi [] = 0
btoi (a:as) | a == '0' = 0 * 2^(length (a:as) - 1) + btoi as
            | otherwise = 1 * 2^(length (a:as) - 1) + btoi as

main = do
    s <- getLine
    let result = btoi s
    print result