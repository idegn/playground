//atcoder arc 11 c
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
string fst,lst;
int N;
string inp[MAX_N];

int d[MAX_N];
bool used[MAX_N];
int prv[MAX_N];

int cost[MAX_N][MAX_N];

int cal(string s, string t, int l){
  int cnt = 0;
  rep(i,l) if(s[i] != t[i]) cnt++;
  return cnt;
}

int main(){
  // cin >> fst >> lst >> N;
  // rep(i, N) cin >> inp[i];
  cin >> inp[0] >> lst >> N;
  N++;
  for(int i = 1; i < N; i++)  cin >> inp[i];
  inp[N] = lst;
  N++;

  fill(d, d+MAX_N, 1000);
  fill(used, used+MAX_N, false);

  rep(i,N){
    rep(j,N){
      int tmp = cal(inp[i], inp[j], inp[i].length());
      if(tmp == 1 || tmp == 0) cost[i][j] = 1;
      else cost[i][j] = 1000;
    }
  }

  

  d[0] = 0;
  while(true){
    int v = -1;

    rep(j,N) if(!used[j] && (v == -1 || d[j] < d[v] )) v = j ;

    if(v == -1) break;
    used[v] = true;

    rep(j,N){
      if(d[j] > d[v]+cost[v][j]) {
	d[j] = d[v]+cost[v][j];
	prv[j] = v;
	// cout << d[j] << endl;
      }
    }
    
  }


  //探索逆からにすれば、出力順ひっくり返せる  
  int n = N-1;
  if(d[n] != 1000){
    cout << d[n] - 1 << endl;    
    while(true){
      cout << inp[n] << endl;
      if(n == 0) break;
      n = prv[n];
    }
  }
  else cout << -1 << endl;
  
}
