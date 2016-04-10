// pccb p52
#include <algorithm>
#include <iostream>
#include <cstdio>
#include <string>
#include <sstream>
#include <cmath>
#include <vector>
#include <set>

using namespace std;

int n;
int it[100],w[100];
int mem[100][100];
int W;

int rec(int i, int j){
  if(mem[i][j] > 0){
    return mem[i][j];
  }

  int res;
  if(i == n){
    res = 0;
  }else if(j < w[i]){
    res = rec(i+1, j);
  }else {
    res = max(rec(i+i, j), rec(i+1, j-w[i]) + it[i]);    
  }
  
  return mem[i][j] = res;
}


int main(){
  memset(mem, -1, sizeof(mem));
  printf("%d\n", rec(0, W));
}
