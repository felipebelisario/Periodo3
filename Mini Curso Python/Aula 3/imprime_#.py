largura = int(input("Largura: "))
altura = int(input("Altura: "))
str_num = []

for num in range(0,largura):
    str_num.append('#')

print("".join(str_num))
str_num = []

for num in range(0,altura+2,largura):
    if(num==0 or num == (altura+1)):
        str_num.append('#')
        print("".join(str_num))
        str_num = []
    else:
        str_num.append(' ')
        print("".join(str_num))
        str_num = []

for num in range(0,largura):
    str_num.append('#')

print("".join(str_num))

alt = int(input("altura = "))

#larg = int(input("largura = "))
#j = 0
#i = 0
#string = []
#for i in range(0,alt):
#	for j in range(0,larg):
#		if(i==0 or i == alt-1 or j==0 or j==larg-1):
#			string.append("#")
#		else:
#			string.append(" ")
#	print(string)
#	string = []