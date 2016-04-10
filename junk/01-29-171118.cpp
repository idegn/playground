//pccb p47
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

int R,N;
int x[1000];

int cnt=0;

int main(){
  cin >> N >> R;
  rep(i,N) cin >> x[i];

  int i,j;
  i = 0;
  while(i < N){
    j = i+1;
    while(j < N){
      if(R < x[j]-x[i]) break;
      j++;
    }
    cnt++;    
    if(j == N) break; //zenbu owari

    i = j-1;    
    while(j < N){
      if(R < x[j]-x[i]) break;
      j++;
    }
    if(j == N) break; //zenbu owari

    i = j;
  }
  
  cout << cnt << endl;
}
