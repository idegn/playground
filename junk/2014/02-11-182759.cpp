//atcoder arc 7 c naosi
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

string N;

int mask[10];
int dp[1<<10];

int main(){
  cin >> N;

  int n = N.length();
  
  rep(i, n){
    mask[i] = 0;
    rep(j,n) if(N[j] == 'o') mask[i] |= 1 << j;
    rotate(N.begin(),N.begin()+1,N.end());
  }

  fill(dp, dp+(1<<10), 10000);

  dp[0] = 0;
  rep(S,1<<n){
    rep(i,n) dp[S|mask[i]] = min(dp[S|mask[i]], dp[S] +1);
  }

  cout << dp[(1<<n)-1] <<endl;
  
}
