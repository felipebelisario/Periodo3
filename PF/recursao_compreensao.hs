dobra :: [Int] -> [Int]
dobra [] = []
dobra(x:xs) =
    2*x : dobra xs

dobra' :: [Int] -> [Int]
dobra' l = [2*y | y <- l]

pares :: [Int] -> [Int]
pares [] = []
pares(x:xs)
    |even x = x : pares xs
    |otherwise = pares xs

pares' :: [Int] -> [Int]
pares' l = [y | y <- l , even y]

concatena :: [String] -> String
concatena [] = []
concatena(x:xs) =
    x ++ (concatena xs)

concatena' :: [[a]] -> [a]
concatena' listaComListas = [x | lista<-listaComListas, x<-lista]

soma :: [Int] -> Int
soma [] = 0
soma(x : xs) =
    x + soma xs

soma' :: [Int] -> Int
soma' [x:xs] = [x+y | y<-xs]

sub :: [Int] -> Int
sub [] = 0
sub(x : xs) =
    x - sub xs

