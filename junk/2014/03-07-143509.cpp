//poj 2229 dame
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

int N;
int dp[1000000];
int po[1010];

int main(){
  cin >> N;

  rep(i,1010) po[i] = i*i;
  
  int n = N+1;
  fill(dp, dp+n, 0);
  int maxt = 1;
  dp[1] = 1;
  for(int i = 2; i < n ; i++){
    if(i == po[maxt+1]){
      //dp[i] = dp[po[maxt]]*2;
      dp[i] = dp[i/2];
      maxt++;
    }else{
      int tmp = i;
      for(int j = maxt; 0 < j && tmp != 0; j--){
	dp[i] += (tmp/po[j])*dp[po[j]];
	tmp = tmp % po[j];
	cout << i << ":" << j << " " << dp[i] << endl;
      }
    }
  }

  rep(i, n){
    cout << i << ":"<< dp[i] << endl;
  }
  
  cout << dp[N] << endl;
  
}
