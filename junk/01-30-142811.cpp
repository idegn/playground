//pccb p85
#include <algorithm>
#include <iostream>
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

#define MAX_N 100000
int par[MAX_N];
int ran[MAX_N];

void init(int n){
  rep(i,n){
    par[i] = i;
    ran[i] = 0;
  }
}

int find(int x){
  if (par[x] == x){
    return x;
  }else{
    return par[x] = find(par[x]);
  }  
}

void unite(int x, int y){
  x = find(x);
  y = find(y);
  if (x == y) return;

  if(ran[x] < ran[y]){
    par[x] = y;
  }else{
    par[y] = x;
    if (ran[x] == ran[y]) ran[x]++;
  }
}

bool same(int x, int y){
  return find(x) == find(y);
}

int N, K;
int typ,x,y;
int cnt = 0;


int main(){  
  cin >> N >> K;

  init(N);
  
  rep(i,K){
    cin >> typ >> x >> y;
    if(x < 1 || N < x || y < 1 || N < y ){
      cnt++;
      continue;
    }

    if(typ == 1){
      if(find[x] == x && find[y] == y){
	  unite(x,y);
      }
    }
  }
  
}
