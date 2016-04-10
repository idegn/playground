//pccb p
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


#define MAX_N 5000

int N,R;
int edges[MAX_N][MAX_N];
int dist[MAX_N];
bool checked[MAX_N];


int main(){
  cin >> N >> R;

  fill(dist, dist + N, 10000);
  fill(checked, checked + N, false);

  rep(i,N) rep(j,N) edges[i][j] = 10000;
  
  rep(i,N) checked[i] = false;

  int from,to,cost;
  rep(i,R){
    cin >> from >> to >> cost;
    edges[from-1][to-1] = cost;
    edges[to-1][from-1] = cost;
  }

  int s,g;
  s = 0; g = N-1;
  dist[s] = 0;
  int tmp;

  int v;
  rep(i,N){
    v=-1;
    rep(u,N) {
      if(!checked[u] && (v == -1 || dist[u] < dist[v])) v=u;
    }

    checked[v] = true;
        
    rep(j,N) {
      printf("dist[%d]:%d dist[%d]:%d edges[%d][%d]:%d\n",j,dist[j],v,dist[v],v,j,edges[v][j]);
      dist[j] = min(dist[j] , dist[v] + edges[v][j]);
    }
  }

  cout << dist[g] << endl;
  
}
