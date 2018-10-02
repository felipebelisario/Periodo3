double :: Num int => int -> int
double x = x + x

soma2 :: Num int => (int,int) -> int
soma2(a,b) = a + b

soma4 :: Num int => (int,int,int,int) -> int
soma4(a,b,c,d) = soma2(soma2(a,b),soma2(c,d))

quadruple :: Num int => int -> int
quadruple x = double(double x)

oitavuple x = double(double(double x))

hipotenusa(x,y) = sqrt(x^2 + y^2) 

area_quadrado x y = x*y

fat x = product[1..x]

media ns = sum ns `div` length ns

isDigit :: Int -> Bool
isDigit(c) = c>=0 && c<=9