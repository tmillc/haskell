module Main where
import Graphics.UI.WX

main :: IO ()
main
  = start hello

hello :: IO ()
hello
  = do  f       <- frame    [text := "Hello!"]
        quit    <- button f [text := "Quit", on command := close f]
        thing   <- button f [text := "Nope"]
        set f [layout := margin 10 (column 5 [floatCentre (label "Hello")
                                             ,floatCentre (widget quit)
                                             ,floatCentre (widget thing)
                                             ] ) ]
