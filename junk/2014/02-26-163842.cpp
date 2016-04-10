//aoj 0118
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

int H,W;
char c[100][100];

int di[] = {0, 1, 0, -1};
int dj[] = {1, 0, -1, 0};

void dfs(int x, int y, char tmp){
  rep(i,4){
    int tx = x+di[i], ty = y+dj[i];
    if(0 <= tx && tx < H && 0 <= ty && ty < W && c[tx][ty] == tmp){
      c[tx][ty] = '.';
      dfs(tx, ty, tmp);
    }      
  }  
}


int main(){
  cin >> H >> W;
  rep(i,H) rep(j,W) cin >> c[i][j];

  int cnt = 0;
  rep(i,H) rep(j,W){
    if(c[i][j] != '.'){
      cnt++;
      char tmp = c[i][j];
      c[i][j] = '.';	          
      dfs(i,j, tmp);
    }
  }

  cout << cnt << endl;
}
