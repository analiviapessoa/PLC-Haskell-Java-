data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

comandos :: Direction -> Command -> Direction
comandos direcao (Forward n) = direcao
comandos direcao (Backward n) = direcao
comandos North TurnLeft = West
comandos South TurnLeft = East
comandos West TurnLeft = South
comandos East TurnLeft = North
comandos North TurnRight = East
comandos South TurnRight = West
comandos West TurnRight = North
comandos East TurnRight = South

calculo :: Direction -> Command -> (Int,Int) -> (Int,Int)
calculo North (Forward n) (x,y) = (x,y+n)
calculo West (Forward n) (x,y) = (x-n,y)
calculo South (Forward n) (x,y) = (x,y-n)
calculo East (Forward n) (x,y) = (x+n,y)
calculo North (Backward n) (x,y) = (x,y-n)
calculo West (Backward n) (x,y) = (x+n,y)
calculo South (Backward n) (x,y) = (x,y+n)
calculo East (Backward n) (x,y) = (x-n,y)
calculo direcao comando (x,y) = (x,y)

destination :: (Int,Int) -> [Command] -> Direction -> (Int,Int) 
destination (x,y) [] direcao = (x,y)
destination (x,y) (a:as) direcao = destination (calculo direcao a (x,y)) as (comandos direcao a)

main = do
       a <- getLine
       b <- getLine
       let result = destination (read a) (read b) North
       print result