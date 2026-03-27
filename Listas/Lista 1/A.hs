isReplica :: String -> Int -> Char -> Bool
isReplica [] x ch | x == 0 = True
                  | otherwise = False 
isReplica (a:as) x ch | a == ch = isReplica as (x-1) ch
                      | otherwise = False

main = do
    a <- getLine
    b <- getLine
    c <- getChar
    let result = isReplica a (read b) c
    print result