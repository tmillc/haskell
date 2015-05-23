-- CURRYING
--
-- add x y  -- a curried function, adding its two arguments
-- add (x,y) -- uncurried, actually a function of one elem (a tuple)
-- type of add is Integer->Integer->Integer,
-- which is equivalent to Integer->(Integer->Integer)
--
-- take :: Int -> [a] -> a
-- take :: Int -> ([a] -> [a])
-- take actually has type "Int to function"
-- because (->) is right associative
--
-- funcn :: blah -> blah -> ... -> blah
-- funcn :: blah -> (blah -> (...blah)))))))
--
x = take 4 [4,3,4,3,3,3] 
-- x == [4,3,4,3]
plus :: Num a => (->) a ((->) a a)
plus a b = a+b

takeFive :: (->) [a] [a]
takeFive = take 5

-- The 'zipTogether' function binds together two lists
zipTogether :: [a] -> [b] -> [(a,b)]
zipTogether [] [] = []
zipTogether xs [] = []
zipTogether [] ys = []
zipTogether xs ys = (head xs, head ys): (zipTogether (tail xs) (tail ys))
-- expected output: 
-- zipTogether [1,2,3] "abc"
-- [(1,'a'),(2,'b'),(3,'c')]

-- alternately, the last line changed
zipTogether' :: [a] -> [b] -> [(a,b)]
zipTogether' [] [] = []
zipTogether' xs [] = []
zipTogether' [] ys = []
zipTogether' (x:xs) (y:ys) = (x,y) : zipTogether xs ys
