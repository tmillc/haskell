-- factorial implementations

facA n = product [ x | x <- [1..n] ]

facB n = if n == 1 then 1
         else n*(facB (n-1))

facC n = if n > 1
         then n * facC(n-1)
         else n
