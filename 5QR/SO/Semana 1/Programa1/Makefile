programa.out: programa.c funcion1.h funcion2.h funcion1.o funcion2.o
	gcc -o programa.out programa.c funcion2.o funcion1.o
	
funcion1.o: funcion1.h funcion1.c
	gcc -c funcion1.c
	
funcion2.o: funcion2.h funcion2.c
	gcc -c funcion2.c
	
limpiar: 
	rm programa.out funcion1.o funcion2.o
