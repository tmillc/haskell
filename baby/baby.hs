-- assorted random stuff while I learn haskell
--

import Data.Char

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1


string1 = "A long \ 
\string" 
-- index notation 
-- [1,2,3] !! 0 yields 1
-- Also of course (!!) [1,2,3] 0 would yield 1

set1 = "abc"
set2 = [1,2,3,4,5]
crosser = [ (x,y) | x<-set1, y<-set2 ]
crosser' x y = [ (a,b) | a<-x, b<-y ]
fster = [ fst x | x<-crosser ]
snder= [ snd x | x<-crosser ]

b = [[1,2,3,4], [5,5,5], [9,10]]
c = b ++ [[1,1,1]]
d = [0,0]:c

-- lists can be compared, lexicographically
-- [4,3,2] > [4,3] yields True
-- [4,3,2] > [4,3,1] also yields True

lengthSublists listOfLists = [ (length x):[] | x<-listOfLists ]
--biggestSublist listOfLists = max  

-- solution I don't understand from SO:
maxIndex xs = head $ filter ((== maximum xs) . (xs !!)) [0..]
-- $, ., (xs !!), filter

-- operations on lists
--
-- head, tail, init, last
-- length, null (returns T/F), reverse
-- take 3 [5,4,3,4,2,1] (returns [5,4,3])
-- drop 3 [5,4,3,4,2,1] (returns [4,2,1])
-- minimum, maximum (compare min, max)
-- sum, product
-- 5 `elem` [3,4,5,6] (returns true)

-- PATTERN MATCHING
agree1 "y" = "Great!"
agree1 "n" = "Too bad"
agree1 ('z':_) = "Zooper" -- matches anything beginning with z
agree1 _ = "So sad" -- matches any other value

-- take 10 (cycle [1,2,3]) 
-- returns [1,2,3,1,2,3,1,2,3,1]
-- take 4 (repeat 5)
-- returns [5,5,5,5], but
-- replicate 4 5 does too
