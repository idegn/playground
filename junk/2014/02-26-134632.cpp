//aoj 0525
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

int R,C;
int mat[10][10000];
int rcnt[10],ccnt[10000];

int main(){
  cin >> R >> C;
  rep(i,R) rep(j,C) cin >> mat[i][j];

  rep(i,R) rep(j,C){
    if(mat[i][j] == 1) rcnt[i]++;
  }

  rep(i,R){
    if(rcnt[i] > R/2){
      rep(j,C){
	if(mat[i][j] == 0) mat[i][j] = 1;
	else mat[i][j] = 0;
      }
    }    
  }

  rep(j,C) rep(i,R){
    if(mat[i][j] == 1) ccnt[j]++;
  }

  rep(j,C){
    if(ccnt[j] > C/2){
      rep(i,R){
	if(mat[i][j] == 0) mat[i][j] = 1;
	else mat[i][j] = 0;
      }
    }    
  }

  int res  = 0;
  rep(i,R) rep(j,C) if(mat[i][j] == 0) res++;

  cout << res << endl;
  
}
