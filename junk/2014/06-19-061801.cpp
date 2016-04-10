//2014 冬 院試 (1),(2)
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

ll memo[100] = {0,1,1};

ll fib(ll n){
  if(memo[n] == 0){
    memo[n] = fib(n-1) + fib(n-2);
  }
  return memo[n];
}

int main(){
  cout << fib(50) << endl;
}
