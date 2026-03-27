sumSquares :: Int -> Int -> Int

sumSquares x y = sqX + sqY
where sqX = x * x
sqY = y * y

sumSquares x y = sq x + sq y
where sq z = z * z

sumSquares x y = let sqX = x * x
sqY = y * y
in sqX + sqY