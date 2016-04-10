//hutsuu linux p111
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[]){
  int i;

  for(i = 1; i < argc; i++){
    FILE *f;
    int c;

    f = fopen(argv[i], "r");
    if(!f){
      perror(argv[i]);
      exit(1);
    }
    while((c = fgetc(f)) != EOF){
      if(c == '\\'){
	if((c = fgetc(f)) != EOF){
	  if(c == 't') printf("\t");
	  else{
	    putchar('\\');
	    putchar(c);
	  }
	}else{
	  putchar('\\');
	}
      }
      else if(c == '\n') puts("$");
      else if(putchar(c) < 0) exit(1);
    }
    fclose(f);    
  }
  exit(0);
}
