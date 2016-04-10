//atcoder arc 12 c
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

#define N 19

char tbl[N][N];

int ocnt = 0, xcnt = 0;
bool used[N][N][4];

int main(){
  rep(i,N) rep(j,N){
    cin >> tbl[i][j];
    if(tbl[i][j] == 'o') ocnt++;
    else if(tbl[i][j] == 'x') xcnt++;
  }
  
  if(!(ocnt == xcnt || ocnt == xcnt+1)) cout << "NO" << endl;

  // int di[] = {0, 1, 1, 1, 0, -1, -1, -1};
  // int dj[] = {1, 1, 0, -1, -1, -1, 0, 1};

  rep(i,N) rep(j,N) fill(used[i][j], used[i][j] +4, false);

  int di[] = {1, 0, 1, -1}; // sita migi migisita migiue
  int dj[] = {0, 1, 1, 1};

  queue<pii> que;
  while(que.empty()){
    pii t = que.front(); que.pop();
    rep(i,4){
      int ti = t.first+di[i], tj = t.second+dj[i];
      if(0 <= ti && ti < N && 0 <= tj && tj < N){
	rep(j,3){
	  if(used[ti][tj][j] != false){
	    int tti = ti,ttj = tj;
	    while()
	  }
	}

      }
    }
    
  }
  
}
