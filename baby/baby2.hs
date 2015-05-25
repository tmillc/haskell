-- made a new companion files to LYAH for no particular reason but to keep them
-- shortish
--
-- List Comprehensions

-- our own version of length, and introducing "_"
-- it replaces every elem with 1, and then sums it up
length' xs = sum [1 | _ <- xs ] 

listOfLists = [[1,2,3,4,5], [3,4,5,4],[1]]
-- removes odd numbers without flattening our list
removeOddFromSublists xxs = [[x | x<-xs, even x]| xs<-xxs]

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

-- fun with tuples!
multsOfFiveAndEven = [ (n, even n) | n <- [5,10..50]]
-- Pythagorean Triples up to 10
pythTrips = [ (a,b,c) | c<-[1..10], b<-[1..c], a<-[1..b]
                        , a^2+b^2==c^2 ]
-- Pythagorean triples up to x
pythTripsTo x = [ (a,b,c) | c<-[1..x], b<-[1..c], a<-[1..b]
                        , a^2+b^2==c^2 ]


-- can compare lists of different sizes
-- [1,2] == [5,5,5,5,5,5]  returns false, same type even though different length
-- (1,2) == (5,5,5,5,5,5) throws an error.. different types
-- (1,2) == ("a",2) also throws an error.. different types
--
--Since (1,2) and (3,4) are of the same type and lists require the same type:
--[(1,2),(3,4)] is valid however [(1,2),(3,4,5)] is not
--
--No such thing as a singleton tuple! Makes sense.
--

f ls = head ls + length ls -- since length is Int, all of f needs to be Int

-- can explicitly state this
g :: [Int] -> Int
g ls = head ls + length ls

-- Note :t (/) and :t div
--
dividesEvenly :: Int -> Int -> Bool
dividesEvenly x y = (y `div` x) * x == y

-- ordered pairs where x=y up to n:
xEqualy n = zip [1..n] [1..n]
-- note that if one list is longer, it'll get cut to match the shorter one

xEqualy' n = zip [1..n] [1..n+1] -- same result as above
xEqualy'' n = zip [1..] [1..n]   -- again same
--
-- At this point:
-- Peter Drake youtube, at Haskell 4: Function Syntax
-- U of Virginia CS1501: Lecture 3 (types?)
-- LYAH:  types and typeclasses
