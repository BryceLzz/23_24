#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include "list.h"



void createEmptyList(tList *L) {
    L->size = 0;
}

void insertItem(Item i, tList *L) {
    Item *n = malloc(sizeof(Item));
    strcpy(n->comando, i.comando);
	  L->items[L->size] = n;
	  L->size ++;
  }


  void deleteList(tList *L){
  	L->size = 0;
  }

  Item getItem(int n, tList *L){
  		return *(L->items[n]);
  }

  int sizeList(tList *L){
  	return L->size;
  }