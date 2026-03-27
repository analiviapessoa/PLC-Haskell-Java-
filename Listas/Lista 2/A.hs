import Prelude hiding (Maybe (..))
import Prelude hiding (Maybe (..))

data Maybe a = Just a |
               Nothing
               deriving(Show)

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond [x] = Nothing
safeSecond (a:b:as) = Just b

main = do
       a <- getLine
       let result = safeSecond (read a::[Int])
       print result