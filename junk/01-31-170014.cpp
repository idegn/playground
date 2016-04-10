//pccb p114
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

ll N;

bool is_prime(int n){
  for(int i = 2; i*i < n; i++){
    if(n%i == 0) return false;       
  }
  return true;
}


int mod_pow(int x, int N, int mod){  
  int res = 1;
  while(N != 0){
    if(N & 1) res = res*x % mod;
    x = x*x%mod;    
    N >>= 1;
  }

  return res;
}




int main(){
  cin >> N;

  if(is_prime(N)){
    cout << "No" << endl;
    return 0;
  }

  for(int x = 2; x < N; x++){
    if(mod_pow(x, N, N) != x % N){
      cout << "No" << endl;
      return 0;      
    }
  }

  cout << "Yes" << endl;
}
