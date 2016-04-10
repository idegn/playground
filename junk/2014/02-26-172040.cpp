//aoj 0558
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

int H,W,N;
char m[1000][1000];

int si,sj;
bool used[1000][1000][9];

int main(){
  cin >> H >> W >> N;
  rep(i,H) rep(j,W){
    cin >> m[i][j];
    if(m[i][j] == 'S'){
      si = i;sj=j;
    }
  }

  rep(i,H) rep(j,W) fill(used[i][j], used[i][j]+9, false);

  used[si][sj][0] = true;
  int di[] = {0, 1, 0, -1};
  int dj[] = {1, 0, -1, 0};
  
  queue<pair<pii,pii>> q;
  int ans = 100000000;
  q.push(MP(MP(si,sj),MP(1,1)));
  m[si][sj] = '.';
  while(!q.empty()){
    pair<pii,pii> tpa = q.front(); q.pop();
    pii tp = tpa.first; int lvl = tpa.second.first;
    int stp = tpa.second.second;
    rep(i,4){
      int tx = tp.first+di[i], ty = tp.second+dj[i];
      if(0 <= tx && tx < H && 0 <= ty && ty < W && used[tx][ty][lvl] == false
	 && m[tx][ty] != 'X'){
	used[tx][ty][lvl] = true;
	if(m[tx][ty] != '.'){
	  if(lvl == N && m[tx][ty] - '0' == N){
	    ans = min(ans, stp);
	  }else if(lvl ==m[tx][ty] - '0') q.push(MP(MP(tx,ty),MP(lvl+1,stp+1)));
	  else q.push(MP(MP(tx,ty),MP(lvl,stp+1)));
	}else{
	  q.push(MP(MP(tx,ty),MP(lvl,stp+1)));
	}
      }
    }    
  }

  cout << ans << endl;
  
}
