f :: (Double,Double) -> Double
f(x,y) = (a+1) * (b+2) where
     a = (x*y)/2
     b = (x+y)/3

saudacao :: String->String
saudacaoLegal = "Ola! Que bom encontrar voce,"
saudacao"Joana" = saudacaoLegal ++"Joana!"
saudacao"Ferando" = saudacaoLegal ++"Fernando!"
saudacao nome = saudacaoInfeliz ++""++ nome
    where
     saudacaoInfeliz = "Oh! Pfft. E voce,"
     

raizes :: Float->Float->Float -> (Float,Float)
raizes a b c = 
    let 
        delta = b^2 -4*a*c 
    in 
        if(delta>=0) 
        then
            (((-b)+sqrt delta)/(2*a),((-b)-sqrt delta)/(2*a))
        else 
            error "Discriminante negativo!"    

raizes2 :: Float->Float->Float -> (Float,Float)
raizes2 a b c = (((-b)+sqrt delta)/(2*a),((-b)-sqrt delta)/(2*a)) where
    delta = b^2 -4*a*c
    if(delta<0) then error "Discriminante negativo!"     
            
