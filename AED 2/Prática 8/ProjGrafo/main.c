#include <stdio.h>
#include <stdlib.h>
#include "Grafo.h"
#define n 5

int main(){
    int tam,i, caminho[5];
    int eh_digrafo = 1;
    Grafo* gr = cria_Grafo(5, 5, 0);

    insereAresta(gr, 0, 1, eh_digrafo, 0);
    insereAresta(gr, 1, 3, eh_digrafo, 0);
    insereAresta(gr, 1, 2, eh_digrafo, 0);
    insereAresta(gr, 2, 4, eh_digrafo, 0);
    insereAresta(gr, 3, 0, eh_digrafo, 0);
    insereAresta(gr, 3, 4, eh_digrafo, 0);
    insereAresta(gr, 4, 1, eh_digrafo, 0);

    int vis[5];
    buscaProfundidade_Grafo(gr, 0, vis);

    printf("\nHamiltoniano:\n\n");

    for(i=0;i<5;i++){
        printf("Elemento %d: ",i+1);
        scanf("%d",&caminho[i]);
    }

    hamiltoniano(gr,caminho);
    
    libera_Grafo(gr);

    return 0;
}
