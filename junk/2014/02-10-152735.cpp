//pccb p148
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

#define MAX_N 4000

int n;
int A[MAX_N],B[MAX_N],C[MAX_N],D[MAX_N];

int CD[MAX_N * MAX_N];

int main(){
  rep(i,n){
    rep(j,n){
      CD[i*n+j] = C[i] + D[j];
    }
  }
  sort(CD, CD+n*n);

  ll res = 0;
  rep(i,n){
    rep(j,n){
      int cd = -(A[i] + B[j]);
      auto ra = equal_range(CD, CD+n*n, cd);
      res += ra.second - ra.first;
    }
  }

  
  
}
