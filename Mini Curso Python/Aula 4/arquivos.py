with open("dados.txt","w") as handler:
    handler.write("")
    for i in range(1,1001):
        handler.write(str(i) + "\n")

with open("dados.txt","r") as handler:
    with open("dadosdobro.txt","w") as handler2:
        for i in range(1,1001):
            p = int(handler.readline())
            p = p*2
            handler2.write(str(p) + "\n")

with open("dados.txt","a") as handler:
    for i in range(1005,2001,5):
        handler.write(str(i) + "\n")