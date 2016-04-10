//hutsuu linux p133
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
  int cnt = 1;
  int c;

  while((c = getc(stdin)) != EOF){
    if(c == '\n') cnt++;
  }

  printf("%d\n", cnt);
  exit(0);  
}
