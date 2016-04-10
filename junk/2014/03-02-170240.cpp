//aoj 1144 poj3309
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
int mp[20][20];

int main(){
  int si,sj,gi,gj;
  
  cin >> H >> W;
  rep(i,H){
    rep(j,W){
      cin >> mp[i][j];
      if(mp[i][j] == 2){
	si = i; sj = j;
      }else if(mp[i][j] == 3){
	gi = i; gj = j;
      }
    }
  }

  int di[] = {0, 1, 0, -1};
  int dj[] = {1, 0, -1, 0};
  
  queue<pair<pii, int>> q;
  q.push(MP(MP(si,sj),0));
  while(!q.emtpty()){
    pair<pii, int> tmp = q.front(); q.pop();
    pii tp = tmp.first; int stp = tmp.second;
    rep(i,4){
      int ti = tp.first+di[i], tj = tp.second+dj[i];
      if(0 <= ti && ti < H && 0 <= tj && tj < W && stp <= 10){
	
	q.push(MP(MP(ti,tj),stp+1));
      }
    }
  }  
}

