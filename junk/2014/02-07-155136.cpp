//atcoder arc 13 b
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

#define MAX_C 100
int C;
//int N[MAX_C],M[MAX_C],L[MAX_C];
int I[MAX_C][3];

int main(){
  cin >> C;
  //rep(i,C) cin >> N[i] >> M[i] >> L[i];
  rep(i,C){
    rep(j,3) cin >> I[i][j];
    sort(I[i], I[i]+3);
  }

  
  
  // rep(i,C){
  //   rep(j,3) cout << I[i][j];
  //   cout << endl;
  // }
  
  
}
