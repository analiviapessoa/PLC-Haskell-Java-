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

faces :: Direction -> [Command] -> Direction
faces inicial [] = inicial
faces inicial (a:as) = faces (comandos inicial a) as

main = do
    a <- getLine
    b <- getLine
    let result = faces (read a) (read b)
    print result

