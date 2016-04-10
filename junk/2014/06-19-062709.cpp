//2014 冬 院試 (3)
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

string s,t;
string result = "00000000000000000000000000000000";
//char result[33];

int main(){
  //cin >> s >> t;

  s = "00123456789012345678901234567890";
  t = "00987654321098765432109876543210";
  // s = "90123456789012345678901234567890";
  // t = "90987654321098765432109876543210";

  int co;
  // rep(i,32){
  for(int i = 31; 0 < i; i--){
    co = 0;
    result[i]  += s[i] + t[i] - '0'*2;
    
    //cout << (int)result[i] << endl;
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
  
  //result = to_string(co) + result;

  cout << result << endl;
  cout << "01111111110111111111011111111100" << endl;
  // cout << (int)'0' << endl;
  // cout << (int)'9' << endl;
}
/*


*/
