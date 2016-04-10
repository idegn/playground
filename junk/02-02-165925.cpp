//pccb p129
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

#define L_MAX 100000
int N,K;
int l[L_MAX];

int c(double len){
  int sum=0;
  rep(i,N){
    sum += (int)(l[i]/len);
  }    
  return sum;
}


int main(){
  cin >> N >> K;
  rep(i,N) cin >> l[i];

  double lb = 0; ub = L_MAX;

  rep(i,10000){
    int mid = (lb + ub)/2;
    if(K < c(mid)){
      lb = mid;
    }else{
      ub = mid;
    }
  }

  cout << ub;
  
}
