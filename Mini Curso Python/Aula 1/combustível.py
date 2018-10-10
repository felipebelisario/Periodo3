tempo = float(input("Tempo gasto (em horas): "))
vm = int(input("Velocidade Media (Km/h): "))

distancia = tempo * vm

combustivel = distancia / 12

print ("Distancia: " + str(distancia) + " Km\n" + "Qnt de combustivel: " + str(combustivel) + " L")