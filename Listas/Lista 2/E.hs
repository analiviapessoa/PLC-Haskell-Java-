data Cmd = Cursor Int
         | Backspace Int
         | Delete Int
         | Insert String
         deriving (Read, Show)

backspace :: String -> Int -> Int -> String
backspace str cursor n = take (cursor-n) str ++ drop cursor str

delete :: String -> Int -> Int -> String
delete str cursor n = take cursor str ++ drop (cursor+n) str

insert :: String -> Int -> String -> String
insert str_inicial cursor str_nova = take cursor str_inicial ++ str_nova ++ drop cursor str_inicial

equivalencia :: String -> Int -> [Cmd] -> String
equivalencia str cursor [] = str
equivalencia str cursor (Cursor n:as) = equivalencia str (cursor+n) as
equivalencia str cursor (Backspace n:as) = equivalencia (backspace str cursor n) (cursor-n) as
equivalencia str cursor (Delete n:as) = equivalencia (delete str cursor n) cursor as
equivalencia str cursor (Insert s:as) = equivalencia (insert str cursor s) cursor as

editText :: String -> [Cmd] -> String
editText str [] = str
editText str comandos = equivalencia str 0 comandos

main = do
       a <- getLine
       b <- getLine
       let result = editText a (read b)
       print result