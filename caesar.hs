import Data.Char
import Data.Ix
import Data.Maybe -- for sixth implementation
import Data.List  -- for sixth implementation
-- 'a' to 'z': 97 to 122
-- 'A' to 'Z': 65 to 90


cipherA :: [Char] -> Int -> [Char]
cipherA [] _ = []
cipherA xs n = [rotateA x n | x <- xs]

rotateA :: Char -> Int -> Char
rotateA s n
    | inRange ('a','z') s = chr ((((ord s) - 97 + n) `mod` 26) + 97)
    | inRange ('A','Z') s = chr ((((ord s) - 65 + n) `mod` 26) + 65)
    | otherwise = '!' -- only handling alphabet for now


-- Second implementation, switch argument order and use "map"
cipherB :: Int -> [Char] -> [Char]
cipherB n = map (rotateB n) 
rotateB :: Int -> Char -> Char
rotateB n s
    | inRange ('a','z') s = chr ((((ord s) - 97 + n) `mod` 26) + 97)
    | inRange ('A','Z') s = chr ((((ord s) - 65 + n) `mod` 26) + 65)
    | otherwise = '!' -- only handling alphabet for now

-- Third implementation, 
cipherC :: Int -> [Char] -> [Char]
rotateC :: Int -> Char -> Char
let2int :: Char -> Int  -- lowercase
int2let :: Int -> Char  -- lowercase
let2int' :: Char -> Int -- uppercase
int2let' :: Int -> Char -- uppercase

cipherC n = map (rotateC n)
-- cipherC n xs = map (rotateC n) xs   -- can drop the xs!!!
rotateC n s
    | inRange ('a', 'z') s = int2let ((let2int s + n) `mod` 26)
    | inRange ('A', 'Z') s = int2let' ((let2int' s + n) `mod` 26)
    | otherwise = '!'

let2int c = ord c - ord 'a'  -- lowercase
let2int' c = ord c - ord 'A' -- uppercase
int2let n = chr (ord 'a' + n)  -- lowercase
int2let' n = chr (ord 'A' + n) -- uppercase

-- Fourth implementation (given solution)
--   Fails on cipherD "Uryyb" (-13) 
--     hangs forever
cipherD :: String -> Int -> String
cipherD "" n = ""
cipherD str n = rotateD (head str) n : cipherD (tail str) n

rotateD :: Char -> Int -> Char
rotateD c 0 = c
rotateD c n = rotateD (next c) (n-1)

next :: Char -> Char
next c = if c == 'z' then 'a' else succ c

-- Fifth implementation (given solution)
--   Fails on cipherE "Uryyb" (-13)
--     returns "bello"
cipherE :: [Char] -> Int -> [Char]
cipherE s n = map (\c -> ([c..'z'] ++ ['a'..c]) !! mod n 26) s

-- Sixth implementation (given solution)
--   Fails on cipherF "Hello" (13)
--     hangs forever
--   Succeeds with cipherF "hello" 13
--   Fails with cipherF "uryyb" (-13)
alphabet :: [Char]
alphabet = cycle ['a'..'z']

rotateF :: Int -> Char -> Char
rotateF k a = alphabet !! (k + ( fromJust ( elemIndex a alphabet)))

cipherF :: [Char] -> Int -> [Char]
cipherF str k = map (rotateF k) str
