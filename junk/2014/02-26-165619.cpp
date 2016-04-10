//aoj 0033
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

static const double EPS = 1e-8;

#define all(vec) (vec).begin(),(vec).end()
#define ll long long
#define MP make_pair
#define rep(i,n) REP(i,0,n)
#define REP(i,a,b) for(int i=a;i<b;i++)
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>

int N;
int in[10];

bool dfs(int l, int r,int x){
  if(in[x] < l && in[x] < r) return false;
  else if(x == 9) return true;
  
  bool res = false;
  if(l < in[x]){
    res |= dfs(in[x],r,x+1);
  }
  if(r < in[x]){
    res |= dfs(l,in[x],x+1);
  }  
  return res;
}

int main(){
  cin >> N;
  
  rep(i,N){
    rep(j,10) cin >> in[j];    
    puts(dfs(0,0,0)?"YES":"NO");    
  }  
}
