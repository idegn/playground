//pccb p
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

#define MAX_N 1000
int N;
int a[MAX_N];

//int dp[MAX_N][MAX_N];
int dp[MAX_N];

int dfs(int i, int j){
  if(i == j) return 1;
  for(int k = i; k < N; k++){
    if(a[i] < a[k])  dfs(k, j) + 1;
  }
}

int main(){
  cin >> N;
  rep(i,N) cin >> a[i];

  fill(dp, dp + MAX_N, 0);
  
  //rep(i,N) dp[i][i] = 1;
 
  rep(i,N){
    for(int j = i; j < N; j++){
      
    }
  }

  
  cout << dp[N-1] << endl;
}
