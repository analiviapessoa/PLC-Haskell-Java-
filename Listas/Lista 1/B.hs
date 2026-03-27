mul2 :: [Int] -> [Int] -> [Int]
mul2 [] [] = []
mul2 [] (b:bs) = mul2 [0] (b:bs)
mul2 (a:as) [] = mul2 (a:as) [0]
mul2 (a:as) (b:bs) = (a * b) : mul2 as bs

main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result