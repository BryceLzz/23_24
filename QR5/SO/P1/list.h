#ifndef __LIST_H__
#define __LIST_H__
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define MAX_CADENA 1024

typedef struct {
	char comando[MAX_CADENA];
} Item;

typedef struct {
	Item *items[4096];
	int size;
}tList;



void createEmptyList(tList *L);
void insertItem(Item i, tList *L);
void deleteList(tList *L);
Item getItem(int n, tList *L);
int sizeList(tList *L);

#endif