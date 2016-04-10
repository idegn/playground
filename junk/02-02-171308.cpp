//pccb p131
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

#define N_MAX 100000
int N,M;
int x[N_MAX];

bool c(int d){
  int last = 0;
  int crt;
  for(int i = 1; i < M; M++){
    crt = last+1;
    while(crt < N+1 && x[crt] - x[last] < d){
      crt++;
    }
    cout << crt << endl;
    if(crt == N+1) {cout << "false"<< endl; return false; }
    last = crt;
  }

  cout << "true" << endl;
  return true;
}

int main(){
  cin >> N >> M;

  x[0]=0;
  for(int i=1; i<N+1;i++) cin >> x[i];
  sort(x, x+N);

  rep(i,N+1) cout << x[i] << endl;
  
  int lb = 0, ub = N_MAX;

  while(ub - lb > 1){
    int mid = (lb+ub)/2;
    cout << mid << endl;
    if(c(mid)){ // true d >= mid
      lb = mid;
    }else{
      ub = mid;
    }
  }
  
  cout << endl << lb << endl;
  
  
}
