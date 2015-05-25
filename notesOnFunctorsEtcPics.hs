import Control.Applicative
-- Functors, Applicatives and Monads in Pictures
-- http://www.adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
--
f1 = (+3) 2 -- 5 as expected
justTwo = Just 2 -- now 2 is in a container
-- (+3) Just 2 -- fails
f2 = fmap (+3) (Just 2) -- 5, hooray

-- Functor is a typeclass
-- a Functor is any data type that defs how
--   fmap applies to it

-- fmap :: (a->b) -> fa -> fb
--   takes a function like (+3)
--   and a Functor like Just 2
--   and returns a new Functor like Just 5

-- applying a function to a list using fmap
succList :: (Enum a) => [a] -> [a]
succList x = fmap (succ) x

-- Control.Applicative defines <*>
--   which knows how to apply a function wrapped in a context
--   to a value wrapped in a context
-- ex:
wrappedAddXtoWrappedY :: Num b => b->b->Maybe b
wrappedAddXtoWrappedY x y = Just (+x) <*> Just y

-- takes a list and returns a list containing the elems raised to 2,3,4th powers
powersUpToFour :: Num b => [b] -> [b]
powersUpToFour xs = [(^2),(^3), (^4)] <*> xs

-- note:
-- ($) :: (a -> b) -> a -> b
-- (<$>) :: Functor f => (a -> b) -> f a -> f b
--
--  ex:
-- (+3) $ (Just 3)  -- ERROR
-- (+3) <$> (Just 3) -- Just 6
--
-- “Armed <$> and <*>, I can take any function that expects any number of unwrapped values. Then I pass it all wrapped values, and I get a wrapped value out"
--
--  ex:
-- (*) <$> Just 5 <*> Just 3     -- Just 15
-- liftA2 (*) (Just 5) (Just 3)  -- Just 15, does the same thing

--
--
--
--
--    MONADS 
--
--

-- review: 
--  Functors apply func to wrapped val
--  Applicatives apply wrapped func to wrapped val
--  
--  Monads apply a func that returns a wrapped val, 
--    to a wrapped val.
--  
-- Monads have a function >>= (pronounced "bind")
--
-- Maybe is a monad.
--
-- suppose half is a funcn that only works on evens
half x = if even x
            then Just (x `div` 2)
            else Nothing
-- takes a val and returns a wrapped val

-- (>>=) :: Monad m => m a -> (a -> m b) -> m b
--   takes a monad like Just 3 (m a)
--   and a funcn that returns a monad like half (a -> m b)
--   and returns a monad like Nothing or Just 3 (m b)

{-
instance Monad Maybe where
    Nothing >>= func = Nothing
    Just val >>= func  = func val
-}

shouldBeFive = Just 20 >>= half >>= half
shouldBeNothing = shouldBeFive >>= half

-- So now we know that Maybe is a Functor, an Applicative and a Monad
--
-- Now the IO monad

-- getLine :: IO String -- takes no args, gets user input
-- readFile :: FilePath -> IO String -- takes string and returns file's contents
-- putStrLn :: String -> IO () -- takes string and prints it
--
-- All take a regular (or no) val and return a wrapped val
printTheFile = getLine >>= readFile >>= putStrLn

-- syntactic sugar for monads, "do" :
printTheFile' = do
                filename <- getLine
                contents <- readFile filename
                putStrLn contents

-- REVIEW
-- functors: apply funcn to wrapped val using fmap or <$>
-- applicatives: apply wrapped funcn to wrapped val
--   using <*> or liftA
-- monads: apply a function that returns a wrapped val,
--   to a wrapped val, using >>= or liftM
