#include <algorithm>
#include <iostream>
#include <set>
#include <sstream>
#include <string>
#include <vector>

#include <cmath>
#include <cstdio>

using namespace std;

#define REP(i,a,b) for(int i=a;i<b;i++)
#define rep(i,n) REP(i,0,n)
#define all(vec) (vec).begin(),(vec).end()

int N;
int d[500];
long long int maxd = 0;
long long int mind = 0;

int maxa(){
  int tmp = 0;
  rep(i,N){
    if(tmp < d[i]){
      tmp = d[i];
    }
  }
  return tmp;
}

int main(){
  cin >> N;
  rep(i,N) cin >> d[i];

  rep(i,N) maxd += d[i];

  if(N == 1){
    mind = maxd;
  }else if(maxa() > maxd - maxa()){
    mind = maxa()*2 - maxd;
  }else{
    mind = 0;
  }

  cout << maxd << endl;  
  cout << mind << endl;
  
}
