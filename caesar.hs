import Data.Char
{- example usage
Prelude> cipher "hello" 13
"uryyb"
'a' to 'z': 97 to 122
'A' to 'Z': 65 to 90
' ' : 32
GHC.Base.ord :: Char -> Int
GHC.Char.chr :: Int -> Char
-}
-- hinted solution
cipher :: [Char] -> Int -> [Char]
cipher [] _ = []
-- cipher "h:ello" 13 = (rotate 'h' 13) : (cipher "ello" 13)
--                     =       u         : (cipher "ello" 13)
cipher (s:ss) n = (rotate s n) : (cipher ss n)
rotate :: Char -> Int -> Char
rotate s n
    | ((ord s) `elem` [97..122]) = chr ((((ord s) - 97 + n) `mod` 26) + 97)
    | ((ord s) `elem` [65..90]) = chr ((((ord s) - 65 + n) `mod` 26) + 65)
    | otherwise = '!' -- only handling alphabet for now


-- Alternate approach unfinished
-- want to express 'rotate 10' and 'cipher 10'
cipher' :: Int -> [Char] -> [Char]
cipher' n s = "hi"
-- cipher' n = map (rotate n)
rotate' :: Int -> Char -> Char
rotate' n s = 'A'

