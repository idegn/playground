//poj 2376
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

#define MAX_N 25000
int N,T;
int a[MAX_N],b[MAX_N];

int main(){
  cin >> N >> T;
  rep(i,N) cin >> a[i] >> b[i];

  int ed = 1;
  int cnt = 0;
  while(ed < T){
    int tmp = ed;
    int ti = -1;
    
    rep(i,N){
      if(a[i] <= ed){
	if(tmp < b[i]){
	  tmp = b[i];
	  ti = i;
	}
      }
    }

    if(ti == -1) break;

    cnt++;
    ed = tmp;
  }

  if(ed < T){
    cout << -1 << endl;
  }else{
    cout << cnt << endl;
  }
  
}
