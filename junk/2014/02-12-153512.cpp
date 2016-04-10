//atcoder arc 8 c
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

#define MAX_N 1000
int N;
double x[MAX_N],y[MAX_N],t[MAX_N],r[MAX_N];

double cost[MAX_N][MAX_N];
double d[MAX_N];
bool used[MAX_N];

int main(){
  cin >> N;
  rep(i,N) cin >> x[i] >> y[i] >> t[i] >> r[i];

  // rep(i,N) {
  //   fill(cost[i], cost[i] + MAX_N, 1000000);
  //   cost[i][i] = 0;
  // }

  fill(used, used + MAX_N, false);
  fill(d, d+N, 10000000);
  
  rep(j,N){
    rep(i,N){
      cost[j][i] = hypot(x[i] - x[j], y[i] - y[j]) / min(r[i], t[j]);
    }
  }

  d[0] = 0;
  while(true){
    int j = -1;

    rep(i,N){
      if(!used[i] && (j == -1 || d[i] < d[j])) j = i;
    }

    used[j] = true;

    rep(i,N) d[i] = min(d[i], d[j] + cost[j][i]);
  }
  
  //降順sort
  //rep(i,N) ans = max(ans, d[i]+1);
  
}

