#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

struct escolas{
	int id;
	char estado[3];
	char cidade[50];
	char rede[7];
	float media_ciencias_natureza;
	float media_ciencias_humanas;
	float media_linguagem;
	float media_matematica;
	float media_redacao;
};

int main(){

	FILE *f;
	char str[500];
	int i=0;
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
    printf("%d",esc[3].id);
	fclose(f);

	return 0;

}
