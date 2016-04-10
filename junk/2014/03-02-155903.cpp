//poj 1742
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

#define MAX_N 100

int N,M;
int a[MAX_N],c[MAX_N];

int dp[100000];

int main(){
  cin >> N >> M;
  rep(i,N) cin >> a[i];
  rep(i,N) cin >> c[i];

  // fill(dp, dp+100000, 0);
  // dp[0] = 1;
  
  // rep(i,N){
  //   for(int j = a[i]; j <= a[i]*c[i] && j <= M; j++){
  //     if(dp[j - a[i]] == 1) dp[j] = 1;
  //   }
  // }

  // cout << count(dp, dp+M, 1) << endl;
  fill(dp, dp+100000, -1);
  dp[0] = -1;

  // rep(i,N){
  //   for(int j = a[i]; j <= M; j++){
  //     if(dp[j] >= 0){
  // 	dp[j] = c[i];
  //     }else if(dp[j - a[i]] < 0){
  // 	dp[j] = -1;
  //     }else{
  // 	dp[j] = dp[j-a[i]] -1;
  //     }
  //   }
  // }

  rep(i,N){
    rep(j,M){//for(int j = a[i]; j <= M; j++){
      if(dp[j] >= 0){
	dp[j] = c[i];
      }else if(j < a[i] || dp[j - a[i]] < 0){
	dp[j] = -1;
      }else{
	dp[j] = dp[j-a[i]] -1;
      }
    }
  }
}
