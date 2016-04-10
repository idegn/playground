//aizu 0005
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

int gcd(int a, int b){
  if(b == 0) return a;
  return gcd(b, a%b);
}

ll a, b;

int main(){
  
  while(cin >> a){
    cin >> b;
    ll x = gcd(a,b);
    cout << x << " " <<  (a/x)*b << endl;
  }
  
}
