#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>


void func_date() {
    	int day, month, year;
 
    	time_t now;

    	struct tm *local = localtime(&now);
 
    	day = local->tm_mday;        
    	month = local->tm_mon + 1; 
    	year = local->tm_year + 1900;  
 	
   	 printf("Date is: %02d/%02d/%d\n", day, month, year);

}

void func_time() {
	int hours, minutes, seconds;

    	time_t now;
 
    	struct tm *local = localtime(&now);
 
    	hours = local->tm_hour;      
    	minutes = local->tm_min;      
    	seconds = local->tm_sec;        
 
    	if (hours < 12) {
        	printf("Time is %02d:%02d:%02d am\n", hours, minutes, seconds);
    	}
    	else {
        	printf("Time is %02d:%02d:%02d pm\n", hours - 12, minutes, seconds);
    	}
}

char* leerEntrada() {
	char line[21];
	gets(line);
	return line;
}

void main() {
	char option[21];
	strcpy(leerEntrada, option);
	
	if(strcmp(option, "date") == 0) {
		func_date();
	} else func_time();
	
}
