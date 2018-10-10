segundos = int(input())

minutos = segundos // 60
horas = minutos // 60

segundos = segundos % 60
minutos = minutos % 60

print (str(horas) + ":" + str(minutos) + ":" + str(segundos))
