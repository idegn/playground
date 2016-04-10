//atcoder arc 5 C
//模範解答はusedに何回壊したかの状態も記録して普通の探索を実装する
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

#define all(vec) (vec).begin(),(vec).end()
#define ll long long
#define MP make_pair
#define rep(i,n) REP(i,0,n)
#define REP(i,a,b) for(int i=a;i<b;i++)
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>


#define MAX_HW 500
int H,W;
char c[MAX_HW][MAX_HW];
bool used[MAX_HW][MAX_HW];

int si,sj,gi,gj;
bool ans = false;

int main(){
  cin >> H >> W;
  rep(i,H) rep(j,W){
    cin >> c[i][j];
    if(c[i][j] == 's'){
      si = i; sj = j;
    }else if(c[i][j] == 'g'){
      gi = i; gj = j;
    }
    used[i][j] = false;
  }


  
  int di[] ={0,1,0,-1},dj[] ={1,0,-1,0};
  queue<pii> que;

  //s
  que.push(MP(si,sj));
  used[si][sj] = true;
  while(!que.empty()){
    pii tmp = que.front(); que.pop();
    rep(i,4){
      int ti = tmp.first + di[i], tj = tmp.second - dj[i];
      if(!used[ti][tj] && 0 <= ti && ti < H && 0 <= tj && tj < W){
	used[ti][tj] = true;
	if(c[ti][tj] == '.') que.push(MP(ti,tj));
	if(c[ti][tj] == '#') c[ti][tj] = '.';
      }
    }
  }
  
  rep(i,H){
    rep(j,W) cout << c[i][j];
    cout << endl;
  }      

  que.push(MP(gi,gj));
  used[gi][gj] = true;
  while(!que.empty()){
    pii tmp = que.front(); que.pop();
    rep(i,4){
      int ti = tmp.first + di[i], tj = tmp.second - dj[i];
      if(!used[ti][tj] && 0 <= ti && ti < H && 0 <= tj && tj < W){
	used[ti][tj] = true;
	if(c[ti][tj] == '.') que.push(MP(ti,tj));
	if(c[ti][tj] == '#') c[ti][tj] = '.';
      }
    }
  }
  
  rep(i,H){
    rep(j,W) {
      cout << c[i][j];
      used[i][j] = false;
    }
    cout << endl;
  }

  que.push(MP(si,sj));
  used[si][sj] = true;
  while(!que.empty()){
    pii tmp = que.front(); que.pop();
    rep(i,4){
      int ti = tmp.first + di[i], tj = tmp.second - dj[i];
      if(!used[ti][tj] && 0 <= ti && ti < H && 0 <= tj && tj < W){
	used[ti][tj] = true;
	if(c[ti][tj] == '.') que.push(MP(ti,tj));
	if(c[ti][tj] == 'g') {
	  ans = true;
	  break;
	}
      }
    }
  }
  

  //printf("%s\n", ans?"YES":"NO");
  puts(ans?"YES":"NO");
}
