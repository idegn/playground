//poj 2393
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

#define MAX_N 10000
int N,S;
int ci[MAX_N],yi[MAX_N];

int main(){
  cin >> N >> S;
  rep(i,N){
    cin >> ci[i] >> yi[i];
  }

  int ans = 0;
  int best = ci[0];  
  rep(i,N){
    int now = ci[i];
    if(now < best) best = now; // best = min(best, now);
    
    ans += yi[i]*best;
    
    best += 5;
  }

  cout << ans << endl;
}
