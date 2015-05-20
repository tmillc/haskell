-- At this point:
-- Peter Drake youtube, at Haskell 4: Function Syntax
-- U of Virginia CS1501: Lecture 3 (types?)
-- LYAH:  types and typeclasses
--
increasing :: (Ord a) => [a] -> Bool -- "for any ordered type a, our function takes a list of a's and returns a bool"
increasing xs = if xs == [] -- if empty, then true
                then True
                else if tail xs == [] -- if one elem, then true
                     then True
                     else if head xs <= head (tail xs) -- if 1st elem <= 2nd elem 
                          then increasing (tail xs)
                          else False

-- Now the same, but instead of the nested ifs, we do pattern matching
increasing' :: (Ord a) => [a] -> Bool
increasing' [] = True
increasing' [x] = True
increasing' (x:y:ys) = x <= y && increasing (y:ys) -- true if x<=y and tail increasing

-- Since pattern matching is sequential, we can reorder to make use of _
increasing'' :: (Ord a) => [a] -> Bool
increasing'' (x:y:ys) = x <= y && increasing (y:ys) -- true if x<=y and tail increasing
increasing'' _ = True -- only remaining cases are single elem or empty lists

-- remove vowels
noVowels :: [Char] -> [Char]
noVowels word = if word == ""  -- if empty
                then ""        -- then empty
                else if head word `elem` "aeiouAEIOU"       -- if 1st letter is vowel
                     then noVowels (tail word)              -- then run noVowels on the rest of the word
                     else (head word) : noVowels (tail word)  -- otherwise, head is a consonant, attach it to 
                                                              -- the tail (running it through noVowels)

-- noVowels version 2, don't need to break into head/tail because pattern matching does it for us
noVowels' :: [Char] -> [Char]
noVowels' "" = ""  -- empty is empty
noVowels' (x:xs) = if x `elem` "aeiouAEIOU" -- if 1st letter is vowel,
                  then noVowels xs         -- run noVowel on the rest excluding 1st letter
                  else x : noVowels xs     -- otherwise, 1st letter is consonant 
                                           -- so cons it to the rest of the word 
                                           -- (running the rest of the word, xs, through noVowel)

-- Guards! Guards! 
--
noVowels'' :: [Char] -> [Char]
noVowels'' "" = ""
noVowels'' (x:xs)
           | x `elem` "aeiouAEIOU" = noVowels xs
           | otherwise             = x : noVowels xs 
--         | boolean condition = what func'n returns

hour :: Int -> [Char]
hour n = if ((n >= 22) && (n < 24)) || ((n >= 0)  && (n <= 6))
         then "Sleeping"
         else if (n>6) && (n<22)
              then "Not sleeping"
              else "Whoops"

hour' n  -- can our first condition be simplified?
    |  ((n >= 22) && (n < 24)) || ((n >= 0)  && (n <= 6)) = show n ++ ": Sleeping"
    |  (n>6) && (n<22) = "Not sleeping"
    | otherwise         = "Whoops!"

-- introducing the 'where' expression
watch :: Int -> [Char]
watch n = show n ++ " o'clock and " ++ message n
    where message 7 = "...Sharknado!"
          message _ = "all's well."  -- catches allothers

-- introducing the 'case' expression
watch' :: Int -> [Char]
watch' n = show n ++ " o'clock and " ++ case n of 7 -> "... Sharknado!"
                                                  _ -> "all's well"
-- NOTE!!! Apparently the _ needs to be directly below the 7, wow weird
--

-- let statements define variables just within a scope, which is handy
-- instead of defining them globally
gravity :: (Fractional a) => a -> a
gravity r = let g = 6.674e-11
                earthMass = 5.972e24
            in g * earthMass / (r^2)


-- should make patterns and guards be exhaustive (using _ and otherwise) 
-- but not necessary,just good
-- where clauses:
-- result where
-- pattern = result
--
-- cannot be nested, only used inside a defn
--
-- let pattern = result
-- ...
-- in result
--
-- case expression of pattern -> result
--
-- Haskell cares about indentation!
--
--
-- Types
--
-- 3 :: Int returns 3
-- 3 :: Double returns 3.0
-- (&&) :: Bool -> Bool -> Bool
-- (:) :: a -> [a] -> [a]  -- as in, 0:[1,2,3]
-- (<) :: Ord a => a -> a -> a -> Bool
-- :t (function)
-- :i (typeclass) ie :i Enum
--
-- Some typeclasses: Show, Enum, Num
-- can use :browse, for the entire Prelude or :browse Prelude equivalently
-- or say Graphics.Gloss is loaded, then :browse Graphics.Gloss
