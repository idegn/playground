//atcoder arc 4 c
#include <algorithm>
#include <iostream>
#include <limits>
#include <queue>
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
#define MP make_pair
#define ll long long

long long int bs,N, s, tM, tN,tmp;
long long int aM = 0;
char hoge;

ll gcd(ll a, ll b){
if(a % b == 0) return b;
else return gcd(b, a%b);
}

int main(){
  cin >> bs >> hoge >> N;

  tmp = gcd(bs,N);
  bs = bs / tmp;
  N = N / tmp;
  
  //cout << tmp;
  
  tN = N;
  for(long long int i = 1; tN < 1000000000; i++,tN = N*i){
    s = tN*(tN+1)/2;
    tM = s - bs*i;
    //cout << tN << " " << s << " " << tM << endl;
    //cout << s << " : " << tM;
    if(0 < tM && tM <= tN){
      aM = tM;
      break;
    }
  }
  
  if(aM == 0){
    cout << "Impossible" << endl;
  }else{
    cout << tN << " " << aM << endl;
  }
}
