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

int main(){
  int a,b;
  cin >> a >> b;
  // a = 6;
  // b = 5;

  int ans = 0;
  while (b > 0) {    
    if(b%2 == 1) ans += a;
    b >>= 1;
    a <<= 1;
  }
  cout << ans << endl;
}
