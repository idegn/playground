//atcoder arc 7 b
#include <algorithm>
#include <iostream>
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

int N,M;
int d[100];
int c[101];

int main(){
  cin >> N >> M;
  rep(i,M) cin >> d[i];
  rep(i,N) c[i] = i+1;

  int nowcd = 0;
  //rep(i,M) swap(nowcd, c[d[i]]);
  rep(i,M){
    rep(j,N){
      if(c[j] == d[i]){
	swap(nowcd, c[j]);
      }
    }
  }

  rep(i,N) cout << c[i] << endl;

  
}
