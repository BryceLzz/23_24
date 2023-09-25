#include <stdio.h>
#include <string.h>
#include <time.h>
#include <sys/stat.h>
#include <unistd.h>
#include "list.c"

int trocearCadena (char * cadena, char * trozos[]) {
	int i = 1;
	if ((trozos[0]=strtok(cadena," \n\t"))==NULL)
		return 0;
	while ((trozos[i]=strtok(NULL," \n\t"))!=NULL)
		i++;
	return i;
}

int imprimirAutores(char* trozos[], char nTrozos) {

		if (nTrozos == 0) {
			printf("Brais López Arias : b.lopez2@udc.es\nRaul Garcia Ferreiro : raul.garcia.ferreiro@udc.es\n");
		} else if (strcmp(trozos[0], "-l") == 0) {
			printf("b.lopez2@udc.es\nraul.garcia.ferreiro@udc.es\n");
		} else if (strcmp(trozos[0], "-n") == 0) {
			printf("Brais López Arias\nRaul Garcia Ferreiro\n");
		} else printf("Comando no valido\n");
	
    return 0;
}

int imprimirPid(char* trozos[], char nTrozos) {

	if (nTrozos == 0) {
		printf("Pid de shell: %d\n", getpid());
	}
	else if (strcmp(trozos[0], "-p") == 0) {
		printf("Pid del padre del shell: %d\n", getppid());
	} else {
		printf("Comando no valido\n");
	}
	
    return 0;
}

void imprimirFecha(char* trozos[]) {
    time_t tiempo;
    struct tm *tm_info;
    char buffer[100];

    time(&tiempo);
    tm_info = localtime(&tiempo);

   strftime(buffer, sizeof(buffer), "%Y-%m-%d", tm_info);
        printf("Fecha actual: %s\n", buffer);
}

void imprimirHora(char* trozos[]) {
    time_t tiempo;
    struct tm *tm_info;
    char buffer[100];

    time(&tiempo);
    tm_info = localtime(&tiempo);

   strftime(buffer, sizeof(buffer), "%H:%M:%S", tm_info);
        printf("Hora actual: %s\n", buffer);
}

int imprimirChdir(char* trozos[], char nTrozos) {
	
	if (nTrozos == 0) {
		if (getcwd(NULL, MAX_CADENA) != NULL) {
			printf ("El directorio actual es %s\n", getcwd(NULL, MAX_CADENA));
		} else perror("No se ha podido encontrar el directorio actual");
	} else {
		if (chdir(trozos[0]) == 0) {
			printf ("El directorio actual es %s\n", getcwd(NULL, MAX_CADENA));
		} else perror("No se ha encontrado el directorio");
	}
		
    	return 0;
}

void leerEntrada(char* cadena) {
	printf("Selecciona una opción: ");
		fgets(cadena, MAX_CADENA, stdin);
}


void elegirFuncion (char *trozos[], int nTrozos, tList *L) {

	if (trozos[0] == NULL) perror("Error, numero invalido de argumentos");
	else if (!strcmp(trozos[0], "autores")) imprimirAutores(&trozos[1], nTrozos - 1);
	else if (!strcmp(trozos[0], "pid")) imprimirPid(&trozos[1], nTrozos - 1);
	else if (!strcmp(trozos[0], "date")) imprimirFecha(&trozos[1]);
	else if (!strcmp(trozos[0], "time")) imprimirHora(&trozos[1]);
	else if (!strcmp(trozos[0], "chdir")) imprimirChdir(&trozos[1], nTrozos - 1);
	else if (!strcmp(trozos[0], "quit") || !strcmp(trozos[0], "bye")  || !strcmp(trozos[0], "exit")) {
		deleteList(L);
		exit (0);
	}
	else printf("Comando no valido\n");
	
}

int main() {

    char *trozos[10];
	char cadena[MAX_CADENA];
	int nTrozos;
	Item i;
	tList L;
	createEmptyList(&L);
	
	while (1) {
		leerEntrada(cadena);
		strcpy(i.comando, cadena);
		nTrozos = trocearCadena(cadena, trozos);
		insertItem(i, &L);
		elegirFuncion(trozos, nTrozos, &L);
	}	

    return 0;
}

