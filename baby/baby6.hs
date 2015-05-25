-- kind of jumping around
-- here's some function syntax from LYAH

-- takes two vectors in 2D space and adds them
--   without pattern matching
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors a b = (fst a + fst b, snd a + snd b)

--   with pattern matching
addVectors' :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors' (x1,y1) (x2,y2) = (x1+x2, y1+y2)

-- fst and snd extract components of pairs, but
--  what about triples?

first :: (a,b,c) -> a
first (x, _, _) = x

second :: (a,b,c) -> b
second (_, y, _) = y

third :: (a,b,c) -> c
third (_, _, z) = z

-- ex
trip = ('a', 2, True)
turnSecondIntoFloatAssumingItsIntegral -- title line! cool!
 = fromIntegral (second trip) :: Float

-- a note:
--   x:xs is pretty common pattern matching, but
--   patterns with : in them will only match against lists 
--   of length 1 or more

-- binds first three elements to vars and the rest to a var
--   x:y:z:zs

-- tells us how many elements, using english too
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "list has one element: " ++ show x
tell (x:y:[]) = "it has two: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "more than two, but the first two are: " ++ show x ++ show y

-- how about generalizing the show part

showSome :: (Show a) => [a] -> 
