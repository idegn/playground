//pccb p35
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

int N,M;
char m[100][100];

int dx[] = {0, 1, 1, 1, 0, -1, -1, -1};
int dy[] = {1, 1, 0, -1, -1, -1, 0, 1};

int c[100][100] = {0};
int wc = 0;

void dfs(int i, int j){
  rep(k,8){
    int tx = i+dx[k];
    int ty = j+dy[k];

    if(0 <= tx && tx < N && 0 <= ty && ty < M){
      if(c[tx][ty] == 2) continue;      
      if(m[tx][ty] == 'W'){
	c[tx][ty] = 2;
	dfs(tx, ty);
      }      
    }
  }
}

int main(){
  cin >> N >> M;
  rep(i,N) rep(j,M) cin >> m[i][j];

  rep(i,N){
    rep(j,M){
      if(m[i][j] == '.' || c[i][j] != 0){
	c[i][j] = 1;
	continue;
      }
      wc++;
      dfs(i, j);
    }
  }

  cout << wc << endl;
}
