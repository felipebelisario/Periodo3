#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

struct escolas{
	int id;
	char estado[3];
	char cidade[50];
	char rede[8];
	float media_ciencias_natureza;
	float media_ciencias_humanas;
	float media_linguagem;
	float media_matematica;
	float media_redacao;
};

void InsertionSort(struct escolas *esc, int N);
int buscaBinaria(struct escolas *esc, int N, int elem);
int buscaSeqOrd(struct escolas *esc, int N, int elem);

int comparaID(const void * a, const void * b){

    if((*(struct escolas *)a).id == (*(struct escolas *)b).id)
        return 0;
    else
        if((*(struct escolas *)a).id < (*(struct escolas *)b).id)
            return -1;
        else
            return 1;

}

int main(){

	FILE *f;
    clock_t ini, fi;
	char str[500];
	int i=0,id;
	unsigned long int t,t2;
	struct escolas *esc;

	esc  = (struct escolas*)malloc(30228*sizeof(struct escolas));

	f = fopen("DadosEnem.txt","r");

	while(1){
		fgets(str,500,f);
		if(feof(f)) break;

		esc[i].id = atoi(strtok(str,";"));
		strcpy(esc[i].estado,strtok(NULL,";"));
		strcpy(esc[i].cidade,strtok(NULL,";"));
		strcpy(esc[i].rede,strtok(NULL,";"));
		esc[i].media_ciencias_natureza = atof(strtok(NULL,";"));
		esc[i].media_ciencias_humanas = atof(strtok(NULL,";"));
		esc[i].media_linguagem = atof(strtok(NULL,";"));
		esc[i].media_matematica = atof(strtok(NULL,";"));
		esc[i].media_redacao = atof(strtok(NULL,";"));
		i++;

	}

	printf("Escolha uma opcao:\n\n1 - Busca binaria\n2 - Busca sequencial ordenada\n\nOpcao: ");
	scanf("%d",&id);

	if(id==1){
        printf("Digite o ID: ");
        scanf("%d",&id);
        ini = clock();
        //InsertionSort(esc,30228);
        qsort(esc,30228,sizeof(struct escolas),comparaID);
        fi = clock();
        t2 = (fi - ini)*1000/CLOCKS_PER_SEC;
        ini = clock();
        id = buscaBinaria(esc,30228,id);
        fi = clock();
        t = (fi - ini)*1000/CLOCKS_PER_SEC;
	}
    else
        if(id==2){
            printf("Digite o ID: ");
            scanf("%d",&id);
            ini = clock();
            //InsertionSort(esc,30228);
            qsort(esc,30228,sizeof(struct escolas),comparaID);
            fi = clock();
            t2 = (fi - ini)*1000/CLOCKS_PER_SEC;
            ini = clock();
            id = buscaSeqOrd(esc,30228,id);
            fi = clock();
            t = (fi - ini)*1000/CLOCKS_PER_SEC;
        }
        else{
            printf("Opcao invalida!\n");
            exit(1);
        }

	if(id == -1) printf("Esse ID nao existe dentro os registrados\n");
	else{
        printf("\nID: %d\nEstado: %s\nCidade: %s\nRede: %s\nMedia ciencias da natureza: %f\nMedia ciencias humanas: %f\nMedia linguagens: %f\nMedia matematica: %f\nMedia redacao: %f\n",esc[id].id,esc[id].estado,esc[id].cidade,esc[id].rede,esc[id].media_ciencias_natureza,esc[id].media_ciencias_humanas,esc[id].media_linguagem,esc[id].media_matematica,esc[id].media_redacao);
        printf("\nTempo busca binaria: %lu milissegundos\nTempo ordenacao qsort: %lu milissegundos\n",t,t2);
	}

	fclose(f);

	FILE *fp;
	fp = fopen("DadosEnemOrdenado.txt","w");

	for(i=1;i<30228;i++){
        fprintf(fp,"%d;%s;%s;%s;%f;%f;%f;%f;%f\n",esc[i].id,esc[i].estado,esc[i].cidade,esc[i].rede,esc[i].media_ciencias_natureza,esc[i].media_ciencias_humanas,esc[i].media_linguagem,esc[i].media_matematica,esc[i].media_redacao);
	}

	fclose(fp);

	return 0;

}


void InsertionSort(struct escolas *esc, int N){

	int i,j;
	struct escolas aux;
	for(i=1;i<N;i++){
		aux = esc[i];
		for(j=i;(j>0) && (aux.id<esc[j-1].id);j--){
			esc[j] = esc[j-1];
		}
		esc[j] = aux;
	}
}

int buscaBinaria(struct escolas *esc, int N, int elem){

    int i, inicio, meio, fim;
    inicio = 0;
    fim = N-1;

    while(inicio<=fim){
        meio = (inicio + fim)/2;
        if(elem < esc[meio].id){
            fim = meio-1;
        }
        else
            if(elem > esc[meio].id){
                inicio = meio+1;
            }
           else
                return meio;
    }

    return -1;
}

int buscaSeqOrd(struct escolas *esc, int N, int elem){

    int i;

    for(i=0;i<N;i++){
        if(esc[i].id == elem) return i;
        else
            if(esc[i].id > elem) return -1;
    }
    return -1;

}
