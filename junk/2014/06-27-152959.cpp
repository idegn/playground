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

string exp64(string s,int se){
  string res = "0000000000000000000000000000000000000000000000000000000000000000";
  rep(i,32){
    res[i+32-se] = s[i];
  }
  return res;
}

string sum(string s, string t){  
  string result = "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  int co;
  for(int i = 127; 0 < i; i--){
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

string mul_inner(string s, int k){
  string result = "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  int co;
  for(int i = 127; 0 < i; i--){
    co = 0;
    // cout << s[i] << "x" << k << endl;
    // result[i]  += (s[i] - '0') * k;

    // cout << i << ":" << result[i] << endl;
    int tmp = (s[i] - '0') * k + result[i]-'0';
    // cout << tmp << endl;
    if(tmp > 9){
      // cout << result[i] << endl;
      co = tmp / 10;
      result[i] = tmp%10 + '0';
    }else{
      result[i] = tmp + '0';
    }
      
    result[i-1] += co;
  }

  result[0]  += (s[0] - '0') * k;
  if(result[0] > '9'){
    cout << "mul:overflow." << endl;
    exit(0);
  }

  // cout <<k << ":" << result << endl;
  return result;  
}



string lshift(string s){
  return s.substr(1) + "0";
}

string mul(string s,int se, string t, int te){
  string res = "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  string u = "0000000000000000000000000000000000000000000000000000000000000000" + exp64(s,se);
  string v = exp64(t,te);
  // cout << "u:" << u << endl << "v:" << v << endl;
  
  for(int i = 63; 0 <= i; i--){
    if(v[i] != '0'){
      res = sum(mul_inner(u, v[i]-'0'), res);
      // cout << "mul:"<<i << ":" << res << endl;
    }
    u = lshift(u);
  }

  int c;
  for(c = 0; c < 128; c++){
    if(res[c] != '0') break;
  }
  cout << "hoge:"<< c << endl;
  cout <<  res.substr(c,5) << endl;
  cout << res.length() << endl;
  return res;
}

int main(){
  string s = "12345678901234567890123456789012";
  int se = 4;
  string t = "98765432109876543210987654321098";
  int te = 9;
  // string s = "30000000000000000000000000000003";
  // int se = 0;
  // string t = "60000000000000000000000000000000";
  // int te = 0;

  cout << exp64(s,se) << endl;
  cout << exp64(t,te) << endl;

  cout << mul(s,se,t,te) << endl;
  long double stest = 1.2345678901234567890123456789012e+4;
  long double ttest = 9.8765432109876543210987654321098e+9;
  cout << stest * ttest << endl ;
}
