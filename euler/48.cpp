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
#define pll pair<ll,ll>
#define pis pair<int,string>

ll limit = 10000000000;

ll pow(ll n){
  ll acc = 1;
  rep(i,n){
    acc *= n;
    if(acc >= limit){
      acc %= limit;
    }
  }
  return acc;
}

int main(){  
  ll ans = 0;
  for(ll i = 1; i < 1000; i++) {
    ans += pow(i);
  }

  cout << "ans: " << ans % limit << endl;  
}
