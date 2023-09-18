#include <stdio.h>
#include <string.h>
#include <time.h>

void imprimirHoraFecha(const char* opcion) {
    time_t tiempo;
    struct tm *tm_info;
    char buffer[100];

    time(&tiempo);
    tm_info = localtime(&tiempo);

    if (strcmp(opcion, "time") == 0) {
        strftime(buffer, sizeof(buffer), "%H:%M:%S", tm_info);
        printf("Hora actual: %s\n", buffer);
    } else if (strcmp(opcion, "date") == 0) {
        strftime(buffer, sizeof(buffer), "%Y-%m-%d", tm_info);
        printf("Fecha actual: %s\n", buffer);
    } else {
        printf("Opción no válida. Usa 'time' para la hora o 'date' para la fecha.\n");
    }
}

int main() {
    char opcion[20];

    printf("Selecciona una opción ('time' para hora, 'date' para fecha): ");
    fgets(opcion, sizeof(opcion), stdin);

    // Elimina el carácter de nueva línea ('\n') si está presente
    if (opcion[strlen(opcion) - 1] == '\n') {
        opcion[strlen(opcion) - 1] = '\0';
    }

    imprimirHoraFecha(opcion);

    return 0;
}

