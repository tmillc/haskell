-- made a new companion files to LYAH for no particular reason but to keep them
-- shortish
--
-- List Comprehensions

-- sum of squares with even result
sumSquares = [ (x,y,x^2 + y^2) | x <- [1..10], y <- [1..10], (x^2 + y^2) `mod` 2 == 0 ] 
-- sum of squares with even result where x even, y odd
sumSquaresHmm = [ (x,y,x^2 + y^2) | x <- [1..10], y <- [1..10], 
            (x^2 + y^2) `mod` 2 == 0,
            (x `mod` 2 == 0) && (y `mod` 2 == 1) ] -- empty 

-- haskell has even and odd though
sumSquares' = [ (x,y,x^2 + y^2) | x <- [1..10], y <- [1..10], even (x^2 + y^2) ]
sumSquaresHmm' = [ (x,y,x^2 + y^2) | x <- [1..10], y <- [1..10], 
            even (x^2 + y^2), 
            (even x) && (odd y) ] -- empty 

sumSquaresHmmHmm = [ (x,y,x^2 + y^2) | x <- [1..10], y <- [1..10],
            odd (x^2 + y^2),
            (even x) && (even y) ]

-- removes vowels from a string
noVowels s = [ x | x <- s, not (x `elem` "aeiou") ] 

-- list comprehension of a list comprehension

-- why broken? -- oh! "cannot have expression at top-level", so named it 
stuff1 = [[x | x <- word, not (x `elem` "aeiou")] | word <- ["cat", "dog", "painter", "cloud"]]
 
-- why broken?
--stuff2 = [[x | x <-num, even x] | num <- [ 1,2,3,4,5]]

-- multiplication table, up through x
multTable x = [[ a*b | a <- [1..x]] | b <- [1..x]]

-- can compare lists of different sizes
-- [1,2] == [5,5,5,5,5,5]  returns false
-- (1,2) == (5,5,5,5,5,5) throws an error.. different types
-- (1,2) == ("a",2) also throws an error.. different types

f ls = head ls + length ls -- since length is Int, all of f needs to be Int

-- can explicitly state this
g :: [Int] -> Int
g ls = head ls + length ls

-- Note :t (/) and :t div
--
dividesEvenly :: Int -> Int -> Bool
dividesEvenly x y = (y `div` x) * x == y


