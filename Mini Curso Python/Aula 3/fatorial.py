num = int(input("Numero: "))

def fatorial(numero):
    fat = 1
    for i in range(1,num+1):
        fat = fat * i
    return fat

fat = fatorial(num)

print("O fatorial é " + str(fat))