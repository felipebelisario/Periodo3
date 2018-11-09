    -- 1: Testes no terminal

    -- 2:

data NomeP = Nome String 
    deriving (Show)

data SobreNomeP = SobreNome String 
    deriving (Show)

type NomeCompleto = (NomeP,SobreNomeP)

compara :: NomeCompleto -> NomeCompleto -> Bool
compara (Nome x, SobreNome y) (Nome w, SobreNome z)
    |x==w && y==z = True
    |otherwise = False

    -- 3:

data Exp a = Val a -- um numero
    | Neg (Exp a)
    | Add (Exp a) (Exp a) -- soma de duas expressoes
    | Sub (Exp a) (Exp a) -- subtracao
    | Mul (Exp a) (Exp a) -- multiplicacao
    | Div (Exp a) (Exp a) -- divisao

avalia :: Fractional a => Exp a -> a
avalia (Val x) = x
avalia (Neg exp) = - (avalia exp)
avalia (Add exp1 exp2) = (avalia exp1) + (avalia exp2)
avalia (Sub exp1 exp2) = (avalia exp1) - (avalia exp2)
avalia (Mul exp1 exp2) = (avalia exp1) * (avalia exp2)
avalia (Div exp1 exp2) = (avalia exp1) / (avalia exp2)

    -- 4:

data LL = Latitude Int Int Int | Longitude Int Int Int 
    deriving (Eq)

instance Show LL where
    show (Latitude a b c) = "Lat " ++ show a ++"°" ++ show b ++"'"++ show c ++"''"

type PosicaoLocal = (String, LL, LL)
type Cidades = [PosicaoLocal]

        -- A)

c1,c2 :: PosicaoLocal
c1 = ("Brasilia", Latitude (-15) 46 47, Longitude 47 55 47)
c2 = ("Uberlandia", Latitude (-18) 55 07, Longitude 48 16 38)

eLat :: PosicaoLocal -> (String,LL)
eLat (p, (Latitude a b c), (Longitude x y z)) = (p,(Latitude a b c))

        -- B)

norteDe :: PosicaoLocal -> PosicaoLocal -> Bool
norteDe (p, (Latitude a b c), (Longitude x y z)) (p2, (Latitude a2 b2 c2), (Longitude x2 y2 z2)) =
    if (a>a2) then True else
        if(a<a2) then False else
            if(b>b2) then True else
                if(b<b2) then False else
                    if(c>c2) then True else
                        if(c<c2)then False else False

        -- C)

lcidades :: Cidades
lcidades =
    [("Rio Branco", Latitude 09 58 29, Longitude 67 48 36),
    ("Brasilia", Latitude (-15) 46 47, Longitude 47 55 47),
    ("Torres", Latitude (-29) 20 07, Longitude 49 43 37),
    ("Joao Pessoa", Latitude (-07) 06 54, Longitude 34 51 47),
    ("Uberlandia", Latitude (-18) 55 07, Longitude 48 16 38)]

        -- C.1)

pegaLatitude :: PosicaoLocal -> Int
pegaLatitude (p, (Latitude a b c), (Longitude x y z)) = a

listaAbaixoEq :: Cidades
listaAbaixoEq = [x | x<-lcidades, (pegaLatitude x) < 0]

abaixoEq :: String
abaixoEq =
     "Das cidades, " ++ show (length listaAbaixoEq) ++ " estao abaixo da linha do Equador"

        -- C.2)

pegaLongitude :: PosicaoLocal -> Int
pegaLongitude (p, (Latitude a b c), (Longitude x y z)) = x

pegaNome :: PosicaoLocal -> String
pegaNome (p, (Latitude a b c), (Longitude x y z)) = p
        
listaEntre :: Cidades
listaEntre = [x | x<-lcidades, (pegaLongitude x) <= 50, (pegaLongitude x) >= 40]
        
entre4050 :: [String]
entre4050 = map (\x->pegaNome x) listaEntre

    --5)

data Talvez a = Valor a | Nada 
    deriving (Show)

divisaoSegura :: Float -> Float -> Talvez Float
divisaoSegura x y = if (y == 0) then Nada else Valor (x/y)  
        -- Não divide se o denominador for = 0

    -- 6)

addPares :: Num a => [(a,a)] -> [a]
addPares lista = [ m+n | (m,n) <- lista ]

        -- A)

addPares' :: (Num a, Ord a) => [(a,a)] -> [a]
addPares' lista = [ m+n | (m,n) <- lista, m < n ]

        -- B)

addPares'' :: (Num a, Ord a) => [(a,a)] -> [a]
addPares'' = \xs -> [ m+n | (m,n) <- xs, m < n ]

        -- C)

addParesT :: (Num a, Ord a) => [(a,a)] -> [a]
addParesT = \xs -> map(\(x,y)->x+y) (filter (\(x,y)->x<y)xs)

    -- 7:

mp :: (a -> a -> a) -> [a] -> [a] -> [a]
mp f [] ys = []
mp f xs [] = []
mp f (x:xs) (y:ys) = f x y : mp f xs ys

    -- 8:

somaQuad :: (Num a, Enum a) => a -> a
somaQuad n = foldr1 (+) (map (\x -> x*x) [1..n])

    -- EXTRA:

data Forma a = Value a | Circulo (Forma a) (Forma a) (Forma a) | Retangulo (Forma a) (Forma a) (Forma a) (Forma a)

area :: (Floating a) => Forma a -> a
area (Value x) = x
area (Circulo _ _ r) = pi * (area r) ^ 2

--data Forma a = Value a | Nothin | Circulo (Forma a) (Forma a) (Forma a) | Retangulo (Forma a) (Forma a) (Forma a) (Forma a)
--    deriving (Show)

--area :: Float -> Forma Float
--area r = if(r==2) then Value(pi * r ^ 2) else Nothin

    -- 9:

somaQuad' :: (Num a, Ord a) => [a] -> a
somaQuad' = 
    \xs -> foldr1 (+) (map (\x -> x*x) (filter (\y -> y>=0) xs))

    -- 10:

fun :: a -> [a]
fun x = [x]

misterio :: [a] -> [a]
misterio xs = foldr (++) [] (map fun xs)  
    -- Separa os elementos da lista em listas separadas e depois os concatena denovo formando a lista original