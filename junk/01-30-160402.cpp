//pccb p102
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

#define N_MAX 5000

int N,R;
int edges[N_MAX][N_MAX] = {0};
bool checked[N_MAX];

int dist[N_MAX];

int from,to,cost;

int main(){
  cin >> N >> R;

  fill(dist, dist + N, 10000);
  
  rep(i,N) checked[i] = false;
  
  rep(i,R){
    cin >> from >> to >> cost;
    edges[from][to] = cost;
    edges[to][from] = cost;
  }

  int s,g;
  s = 0; g = N-1;
  int tmp;

  rep(i,N){
    rep(j,N){
      if(edges[s][j] != 0 && checked == false){
	if(edges[s][j] < edges[s][tmp]){
	  tmp = j;
	}
      }
    }

  }
  
}
