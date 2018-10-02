-- 1:

lInteiros :: Int -> Int -> [Int]
lInteiros a b = 
    if(a==b) 
    then [a]
    else [a..b]

-- 2:

repetidos :: [Int] -> [Int]
repetidos [] = []
repetidos(x:xs) =
    x : (x : repetidos xs)
    
-- 3:

divisores :: Int -> [Int]
divisores n = [x | x<-[1..n], n `mod` x == 0]

-- 4 && 5:

insere_c :: Int -> [Int] -> [Int]
insere_c h [] = [h]
insere_c h (x:xs)
    |h<=x = (h:(x:xs))
    |otherwise = (x:insere_c h xs)

ordena_c :: [Int] -> [Int]
ordena_c [] = []
ordena_c(x:xs) =
    insere_c x (ordena_c xs)
    
-- 6:

par_impar :: [Int] -> [[Int]]
par_impar l = 
    [[x | x<-l, even x]] ++ [[x | x<-l, odd x]]

    -- ou

pares :: [Int] -> [Int]
pares [] = []
pares(x:xs)
    |even x = x : pares xs
    |otherwise = pares xs

impares :: [Int] -> [Int]
impares [] = []
impares(x:xs) 
    |odd x = x : impares xs
    |otherwise = impares xs

par_impar' :: [Int] -> [[Int]]
par_impar' l = [pares l] ++ [impares l]

-- 7:

uniao :: [Int] -> [Int] -> [Int]
uniao l1 l2 = ordena_c (l1 ++ l2)

-- 8:

-- 9: NEM FODENDO

-- 10:

removeElem :: Int -> [Int] -> [Int]
removeElem h [] = []
removeElem h (x:xs)
    |h==x = removeElem h xs
    |otherwise = x : removeElem h xs

conjunto :: [Int] -> [Int]
conjunto [] = []
conjunto(x:xs) =
    (x:(conjunto(removeElem x xs)))

