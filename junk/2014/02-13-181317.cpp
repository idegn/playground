//atcoder arc 10 c
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

int n,m,Y,Z;

map<char, int> cb;
string inp;

int dfs(int i){
  int j = i;
  for(; ; j++){
    ans += cb[inp[i]];
    
    if(inp[j] != inp[j+1]) break;
  }

  ans += Y*(j - i);

  //for(; ; j++){
  while(true){
    
    for(;; j){
      if(inp[j] != inp[j+1]) break;
    }    
    if(inp[i] == inp[j+1]) break;
  }

  return ans;  
}


int main(){
  cin >> n >> m >> Y >> Z;  
  rep(i,m) {
    char c; int tmp;
    cin >> c >> tmp;
    cb[c] = tmp;
  }
  cin >> inp;

  

  
}
