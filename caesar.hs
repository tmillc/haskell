import Data.Char
import Data.Ix
-- 'a' to 'z': 97 to 122
-- 'A' to 'Z': 65 to 90


cipher :: [Char] -> Int -> [Char]
cipher [] _ = []
cipher xs n = [rotate x n | x <- xs]

rotate :: Char -> Int -> Char
rotate s n
    | inRange ('a','z') s = chr ((((ord s) - 97 + n) `mod` 26) + 97)
    | inRange ('A','Z') s = chr ((((ord s) - 65 + n) `mod` 26) + 65)
    | otherwise = '!' -- only handling alphabet for now


-- Second implementation, switch argument order and use "map"
cipher' :: Int -> [Char] -> [Char]
cipher' n = map (rotate' n) 
rotate' :: Int -> Char -> Char
rotate' n s
    | inRange ('a','z') s = chr ((((ord s) - 97 + n) `mod` 26) + 97)
    | inRange ('A','Z') s = chr ((((ord s) - 65 + n) `mod` 26) + 65)
    | otherwise = '!' -- only handling alphabet for now

-- third implementation, 
cipher'' :: Int -> [Char] -> [Char]
rotate'' :: Int -> Char -> Char
let2int :: Char -> Int  -- lowercase
int2let :: Int -> Char  -- lowercase
let2int' :: Char -> Int -- uppercase
int2let' :: Int -> Char -- uppercase

cipher'' n = map (rotate'' n)
-- cipher'' n xs = map (rotate'' n) xs   -- can drop the xs
rotate'' n s
    | inRange ('a', 'z') s = int2let ((let2int s + n) `mod` 26)
    | inRange ('A', 'Z') s = int2let' ((let2int' s + n) `mod` 26)
    | otherwise = '!'

let2int c = ord c - ord 'a'  -- lowercase
let2int' c = ord c - ord 'A' -- uppercase
int2let n = chr (ord 'a' + n)  -- lowercase
int2let' n = chr (ord 'A' + n) -- uppercase
