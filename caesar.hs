-- example usage
-- Prelude> cipher "hello" 13
-- "uryyb"

-- hinted solution
cipher :: [Char] -> Int -> [Char]
cipher [] _ = []
-- cipher "h:ello" 13 = (rotate 'h' 13) : (cipher "ello" 13)
--                     =       u         : (cipher "ello" 13)
cipher (s:ss) n = (rotate s n) : (cipher ss n)
--
rotate :: Char -> Int -> Char
rotate s n = 'A'

--
--
-- agdg hint
-- want to express 'rotate 10' and 'cipher 10'
cipher' :: Int -> [Char] -> [Char]
cipher' n s = "hi"
-- cipher' n = map (rotate n)
rotate' :: Int -> Char -> Char
rotate' n s = 'A'
-- modulo hint, check ord and chr (Data.Char)
--
