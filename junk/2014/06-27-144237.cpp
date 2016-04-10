//東大　院試 2014-2 (4)
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

string sum(string s, string t){  
  string result = "00000000000000000000000000000000";
  int co;
  for(int i = 31; 0 < i; i--){
    co = 0;
    result[i]  += s[i] + t[i] - '0'*2;
    
    if(result[i] > '9'){
      result [i] -= 10;
      co = 1;
    }
    result[i-1] += co;
  }
  
  result[0]  += s[0] + t[0] - '0'*2;
  if(result[0] > '9'){
    cout << "overflow." << endl;
    exit(0);
  }

  return result;
}

string memo[150] = {
  "00000000000000000000000000000000",
  "00000000000000000000000000000001",
  "00000000000000000000000000000001"
};

string fib(int n){
  if(memo[n] == ""){
    memo[n] = sum(fib(n-1), fib(n-2));
  }

  return memo[n];
}

int main(){
  // string s = "00123456789012345678901234567890";
  // string t = "00987654321098765432109876543210";
  
  //rep(i,10) cout << fib(i) << endl;
  cout << fib(140) << endl;
}
