//atcoder arc 6 c
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

#define MAX_N 51
int N;
int d[MAX_N];

int po[MAX_N];

int main(){
  cin >> N;
  rep(i,N) cin >> d[i];  

  fill(po, po+MAX_N, 100000);
  
  int tpo = 0;
  rep(i,N){
    int tmp = tpo;
    rep(j,tpo){
      if(d[i] <= po[j] && po[j] < po[tmp]) tmp = j;
    }
    if(tmp == tpo){
      po[tpo++] = d[i];
    }else{
      po[tmp] = d[i];
    }
  }

  cout << tpo << endl;
  
}
