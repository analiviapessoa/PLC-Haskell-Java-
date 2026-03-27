data Bool = True | False
data Estacao = Inverno | Verao | Outono | Primavera
data Temp = Frio | Quente

--Casamento de padrões
clima :: Estacao -> Temp
clima Inverno = Frio
clima _       = Quente

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ "--" ++ show a
--Pessoa :: Nome -> Idade -> Pessoas

