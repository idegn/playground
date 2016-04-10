//atcoder arc 2 b
#include <algorithm>
#include <iostream>
#include <cstdio>
#include <string>
#include <sstream>
#include <cmath>
#include <vector>

using namespace std;

int Y,M,D;
int cal[13] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

int main(){
  scanf("%d/%d/%d", &Y, &M, &D);

  while(true){
    if(Y%(M*D) == 0){
      break;
    }

    if(Y%400 == 0 || (Y%100 != 0 && Y%4 == 0 )){
      cal[2] = 29;
    }else{
      cal[2] = 28;
    }
      
    if(D%cal[M] == 0){ // %する必要ない
      D = 1;
      if(M%12 == 0){ // %する必要ない
	M = 1;
	Y++;
      }else{
	M++;
      }
    }else{
      D++;
    }
    
  }

  printf("%d/%02d/%02d\n",Y,M,D);
}
