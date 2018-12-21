-- Trabalho de Programacao Funcional

--Aluno: Felipe Alves Belisario (11721BCC030)

data ClienteQChega = Nao | Sim TempoQChegou TempoPAtend 
    deriving (Eq,Show)
type TempoQChegou = Int
type TempoPAtend = Int


data ClienteQSai = Nenhum | Liberado TempoQChegou TempoDEsp TempoPAtend 
    deriving (Eq,Show)
type TempoDEsp = Int


type Fila = [Int]


estaVazia :: Fila -> Bool
estaVazia [] = True
estaVazia _ = False


enfileira :: Int -> Fila -> Fila
enfileira a x = (a:x)


desenfileira :: Fila -> (Int,Fila)
desenfileira x
    |not (estaVazia x) = (head x,tail x)
    |otherwise = error "erro: a fila esta vazia"


type EstadoDaFila = (Tempo,TempoDeAtend,[ClienteQChega])
type Tempo = Int
type TempoDeAtend = Int

adicionaCliente :: ClienteQChega -> EstadoDaFila -> EstadoDaFila
adicionaCliente m (tempo,tempDeAtend,ml) = (tempo,tempDeAtend, ml++[m])

processaFila ::EstadoDaFila -> (EstadoDaFila, [ClienteQSai])
processaFila (tempo,tempDeAtend,(Sim a tempNecDAtend:resto))
    |tempDeAtend < tempNecDAtend =((tempo+1,tempDeAtend+1,(Sim a tempNecDAtend:resto)),[])
    |otherwise = (((tempo+1),0,resto),[Liberado a (tempo-tempNecDAtend-a) tempNecDAtend])
processaFila (tempo,tempDeAtend,[]) = ((tempo+1,tempDeAtend,[]),[])            


filaDeInicio :: EstadoDaFila
filaDeInicio = (0,0,[])


tamanhoDaFila :: EstadoDaFila -> Int
tamanhoDaFila (tempo,tempoDeAtend,l) = length l


filaVazia :: EstadoDaFila -> Bool
filaVazia (t,s,q) = (q == [])


type EstadoDoServidor = [EstadoDaFila]


colocaNaFila :: Int -> ClienteQChega -> EstadoDoServidor -> EstadoDoServidor
colocaNaFila n im st = take n st ++ [novoEstadoDaFila] ++ drop (n+1) st
    where
        novoEstadoDaFila = adicionaCliente im (st!!n)

processaServidor :: EstadoDoServidor -> (EstadoDoServidor, [ClienteQSai])
processaServidor [] = ([],[])
processaServidor (q:qs) = ((nq:nqs),mess ++ messes) where
        (nq,mess)    = processaFila q
        (nqs,messes) = processaServidor qs 

processaSimulacao :: EstadoDoServidor -> ClienteQChega -> (EstadoDoServidor,[ClienteQSai])
processaSimulacao estServ im = (adicionaNovoObjeto im estServ1,clientQSai)
    where
        (estServ1,clientQSai) = processaServidor estServ

adicionaNovoObjeto :: ClienteQChega -> EstadoDoServidor -> EstadoDoServidor
adicionaNovoObjeto Nao estServ = estServ
adicionaNovoObjeto (Sim tempoDeChegada tempoNecAtend) estServ = colocaNaFila (menorFila estServ) (Sim tempoDeChegada tempoNecAtend) estServ

estadoInicialDoServidor :: EstadoDoServidor
estadoInicialDoServidor = copy nroDeFilas filaDeInicio

nroDeFilas :: Int
nroDeFilas = 1

copy :: Int -> EstadoDaFila -> EstadoDoServidor
copy 0 inicial = []
copy numero inicial = [inicial] ++ (copy (numero-1) inicial)

tamanhoDoServidor :: EstadoDoServidor -> Int
tamanhoDoServidor = length

menorFila :: EstadoDoServidor -> Int
menorFila [q] = 0
menorFila (q:qs)
    |tamanhoDaFila (qs!!menor) <= tamanhoDaFila q = menor + 1
    |otherwise = 0
    where
         menor = menorFila qs


proxNumAleat :: Integer -> Integer
proxNumAleat n = (multiplicador*n + incremento) `rem` modulo

seqAleatoria :: (Integer -> [Integer])
seqAleatoria semente = iterate (proxNumAleat) semente

semente :: Integer 
semente = 17489
multiplicador :: Integer
multiplicador = 25173
incremento :: Integer
incremento = 13849
modulo :: Integer
modulo = 65536
                         
dist :: Num t => [(t, Float)]                    
dist = [(1,0.2),(2,0.25),(3,0.25),(4,0.15),(5,0.1),(6,0.05)]
                           
geraFuncao :: [(t,Float)] -> (Float -> t)
geraFuncao dist = geraFun dist 0.0

geraFun ((ob,p):dist) nUlt aleat
    | nProx >= aleat && aleat > nUlt = ob
    |otherwise = geraFun dist nProx aleat
    where
        nProx = (p* (fromInteger modulo) + nUlt)
                       
-- Inicio da simulacao:
                      
simule :: EstadoDoServidor -> ([ClienteQChega] -> [ClienteQSai])
simule estDoServ (im:messes) = outmesses ++ simule proxEstDoServ messes
    where
        (proxEstDoServ,outmesses) = processaSimulacao estDoServ im

seqDeTempos :: [TempoPAtend]                                                         
seqDeTempos = map (geraFuncao dist . fromInteger) (seqAleatoria semente)

entradaDaSimulacao = zipWith Sim [ 1..] seqDeTempos                             
entradaDaSimulacao2 = take 50 entradaDaSimulacao ++ naos

naos = (Nao:naos)

tempoDeEsperaTotal :: ([ClienteQSai] -> Int)
tempoDeEsperaTotal = sum . map tempoDEsp
 where
    tempoDEsp (Liberado _ w _) = w

    
--Experimentos a serem realizados:

--1) nroDeFilas(variavel de estadoInicialDoServidor) = 1
--   tempoDeEsperaTotal (take 50 (simule estadoInicialDoServidor entradaDaSimulacao2))
--   Resultado com 1 fila : 3358

--2) O numero de caixas necessarias para que o tempo de espera caia para 0 é 5 caixas    

--3)

rrobin n = n `mod` nroDeFilas

adicionaNovoObjetoRR :: ClienteQChega -> EstadoDoServidor-> EstadoDoServidor
adicionaNovoObjetoRR Nao estServ = estServ
adicionaNovoObjetoRR (Sim tempoDeChegada tempoNecAtend) estServ = 
    colocaNaFila (rrobin tempoDeChegada) (Sim tempoDeChegada tempoNecAtend) estServ

--   -> Resultado com 1 fila : 3358 
--   -> O numero de caixas necessarias é de 7 caixas  
           
--4)
