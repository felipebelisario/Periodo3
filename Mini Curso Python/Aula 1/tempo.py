segundos = int(input("Quantos segundos? "))

minutos = segundos // 60
horas = minutos // 60
dias = horas // 24

segundos = segundos % 60
minutos = minutos % 60

# Definir quantas casas depois da virgula: print ("%.2f"%(minutos))

print ("\nDias:", dias)
print ("Horas:", horas)
print ("Minutos:", minutos)
print ("Segundos:", segundos, "\n")

