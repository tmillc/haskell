-- hw lec03 u of virg: writer a caesar cipher
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

-- agdg hint
-- want to express 'rotate 10' and 'cipher 10'
cipher' :: Int -> [Char] -> [Char]
cipher' n s = "hi"
-- cipher' n = map (rotate n)
rotate' :: Int -> Char -> Char
rotate' n s = 'A'
-- modulo hint, check ord and chr (Data.Char)
-- caesar cipher moved to caesar.hs


-- LYAH stuff
-- :: is read as "has type of"
-- funcn :: Int -> Char  -- this is a type declaration
-- head :: [a] -> a      -- 'a' is a type variable
--
-- functions with type variables are called 'polymorphic'
--
-- Some basic types: 
-- Int is bounded, Integer is not (but less efficient), Char,
--   Bool, Float (single point precision), Double (double it)
--
-- (==) :: (Eq a) => a -> a -> Bool
-- Before the "=>" is our class restraint
--
-- Some basic typeclasses: 
-- Eq for types that support equality testing,
-- Ord for types that have an ordering,
--   to be in Ord, a type first must be in Eq
-- Show for types that can be presented as strings
-- Read is kind of the opposite, ex:
--   read :: Read a => String -> a
--   read "8.2" + 3.8
--   returns 12.0
-- but:
--   read "4" ERRORs
--   read "4" :: Int  (returns 4)
--   read "[1,2]" :: [Int]
--     This is using "explicit type annotation."
-- 
-- Compiler doesn't know if we want "4" as an Int or Float or whatever, and since Haskell is statically typed, it has to know all types before code is compiled.
-- 
-- More typeclasses:
-- Enum are sequentially ordered, can be enumerated
--  can use its types in list ranges, and have defined succ and pred
--  Enum types: (), Bool, Char, Ordering, Int, Integer, Float, Double
--  "minBound and maxBound are interesting because they have a type of (Bounded a) => a. In a sense they are polymorphic constants."
--  ex: minBound::Int, minBound::Bool, ... no parameters but specify a type
--  whole numbers are also polymorphic constants
--  ex: 20::Int, 20::Integer, 20::Float, 20::Double
--
--  Num is another typeclass
--   ex: (*) :: (Num a) => a -> a -> a -> a
--   Note: (5::Int) * (6::Integer) will fail
--     but 5 * (6::Integer) will produce an Integer
--  to be in Num, a type must already be in Show and Eq
--
--  Integral is a typeclass including Int and Integer. 
--
--  Floating contains Float and Double
--
--  fromIntegral :: (Num b, Integral a) => a -> b
--    turns an Integral into a more general Num
--  length [1,2,3] + 2.3 fails, but
--  fromIntegral (length [1,2,3]) + 3.2 works
--
--
--  CURRYING note:
-- add :: Int -> Int -> Int equiv Int->(Int->Int)
-- add 1 ::      Int -> Int
-- add 1 3 :: Int

-- our own implementations of some functions
length' :: (Num a) => [a] -> a
length' [] = 0
length' (x:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: (Num a) => [a] -> a
product' [] = 1
product' (x:xs) = x * product' xs

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list"
maximum' [x] = x
maximum' (x:xs)
         | x > mx       = x
         | otherwise    = mx
         where mx = maximum' xs

