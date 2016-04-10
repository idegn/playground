//atcoder arc 15 c
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

#define MAX_N 200

int N;
string inp[MAX_N][2];
int m[MAX_N];

map<string,string> tbl;

int main(){
  cin >> N;
  rep(i,N){
    cin >> inp[i][0] >> m[i] >> inp[i][1];
    tbl[inp[i][1]] = inp[i][0];
  }

  // if(tbl["hoge"] == "") cout << "huga";
  
  
  
  cout << tbl["hoge"] << endl;;
}
