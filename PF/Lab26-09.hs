type Nome = String
type Preco = Int
type CodBar = Int
type BaseDeDados = [(CodBar,Nome,Preco)]
type ListaDeCodigos = [CodBar]
type Recibo = [(Nome,Preco)]


listaDeProdutos :: BaseDeDados
listaDeProdutos = [ (1234, "Oleo DoBom, 1l" , 195), 
    (4756, "Chocolate Cazzeiro, 250g" , 180), 
    (3216, "Arroz DoBom, 5Kg", 213), 
    (5823, "Balas Pedregulho, 1Kg" , 379), 
    (4719, "Queijo Mineirim, 1Kg" , 449), 
    (6832, "Iogurte Maravilha, 1Kg" , 499), 
    (1112, "Rapadura QuebraDente, 1Kg", 80), 
    (1111, "Sal Donorte, 1Kg", 221), 
    (1113, "Cafe  DoBom, 1Kg", 285), 
    (1115, "Biscoito Bibi, 1Kg", 80), 
    (3814, "Sorvete QGelo, 1l", 695)]

tamLinha :: Int
tamLinha = 30

formataCentavos :: Preco -> String
formataCentavos p
    |qnt_centavos < 10 = show (div p 100) ++ ".0" ++ show qnt_centavos
    |otherwise = show (div p 100) ++ "." ++ show qnt_centavos
    where
        qnt_centavos = rem p 100

formataLinha :: (Nome,Preco) -> String
formataLinha (x,y) = 
    x ++ replicate (tamLinha - length x - length (formataCentavos y)) '.' ++ formataCentavos y ++ "\n"

formataLinhas :: [(Nome,Preco)] -> String
formataLinhas [] = ""
formataLinhas((x,y):xs) = 
    formataLinha(x,y) ++ formataLinhas xs

geraTotal :: Recibo -> Preco
geraTotal [] = 0
geraTotal((x,y):xs) =
    y + geraTotal xs

formataTotal :: Preco -> String
formataTotal p = 
    "Total" ++ replicate (tamLinha - length "Total" - length (formataCentavos p)) '.' ++ formataCentavos p

formataRecibo :: Recibo -> String
formataRecibo l = formataLinhas l ++ formataTotal (geraTotal l)

acha :: BaseDeDados -> CodBar -> (Nome,Preco)
acha [] x1 = error "produto nao cadastrado"
acha ((x,y,z):xs) x1
    |x1==x = (y,z)
    |otherwise = acha xs x1

achaItem :: CodBar -> (Nome,Preco)
achaItem x = acha listaDeProdutos x

fazRecibo :: ListaDeCodigos -> Recibo
fazRecibo [] = []
fazRecibo (x:xs) =
    achaItem x : fazRecibo xs

fazRecibo' l = [acha listaDeProdutos x | x<-l]

fazRecibo'' l =
    map (acha listaDeProdutos) l

