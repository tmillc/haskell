-- factorial implementations

facA n = product [ x | x <- [1..n] ]

facB n = if n == 1 then 1
         else n*(facB (n-1))
