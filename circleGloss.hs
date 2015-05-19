import Graphics.Gloss

main :: IO ()
main = playBanana (InWindow "Nice Window" (200,200) (800,200))
                    white
                    30
                    (\_ _ -> return $ pure $ circle 10)
