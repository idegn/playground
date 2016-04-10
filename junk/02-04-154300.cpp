//pccb p100
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
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>

#define MAX_V 10000
#define INF 10000

int cost[MAX_V][MAX_V];
int V;

int mincost[MAX_V];
bool used[MAX_V];

int main(){
  rep(i,V){
    mincost[i] = INF;
    used[i] = false;
  }

  mincost[0] = 0;
  int res = 0;

  while(true){
    v = -1;
    rep(u,V){
      if(!used[u] && (v == -1 || mincost[v] > mincost[u])) v = u;
    }        

    if(v == -1) break;

    used[v] = true;
    res += mincost[v];

    rep(i,V){
      mincost[i] = min(mincost[i], cost[v][i]);      
    }
    
  }
  
  return res;
    
}
  

