// stack
#include <algorithm>
#include <iostream>
#include <map>
#include <queue>
#include <set>
#include <sstream>
#include <string>
#include <vector>

#include <cmath>
#include <cstdio>

using namespace std;

#define all(vec) (vec).begin(),(vec).end()
#define ll long long
#define MP make_pair
#define rep(i,n) REP(i,0,n)
#define REP(i,a,b) for(int i=a;i<b;i++)
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>

int N = 10;

void hoge(int n){
  if(n == 0) return ;

  hoge(n >> 1);
  cout << (n & 1);
}
  

int main(){

  hoge(N);
  cout <<endl;
    
  return 0; 
}

