//atcoder arc 20 b
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

int N,C;
int a[100];

int main(){
  cin >> N >> C;
  rep(i,N) cin >> a[i];

  int ansk = 100;

  REP(i,1,11){
    REP(j,1,11){
      if(i == j) continue;
      int tmp = 0;
      rep(k,N){
	int t;
	if(k%2 == 0) t = i;
	else t = j;
	if(a[k] != t) tmp++;
      }
      ansk = min(tmp, ansk);
    }
  }

  cout << ansk*C << endl;
}
