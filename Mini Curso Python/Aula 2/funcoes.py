def ola():
    print("Oi amigo")

def ola2(nome = "Visitante"):
    print("Ola", nome)

def meunome(nome,endereco,idade):
    print(nome,endereco,idade)
    return nome,endereco,idade


ola()
ola2("Felps")
teste = meunome("Felps","Licydio Paes", 18)
print(teste)
nome, endereco, idade = meunome("Felpo","seu cu",17)
print(nome, endereco, idade)