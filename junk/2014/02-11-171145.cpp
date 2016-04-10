//atcoder arc 7 c
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

string N;

int main(){
  cin >> N;
  string hoge = N;
  vector<int> ox[2];
  
  int tmp = 0;
  int foo;
  while (true) {
    foo = N.find("x", tmp);
    if(foo == -1) {
      ox[0].push_back(N.length() - tmp);
      break; //owari
    }
    ox[0].push_back(foo - tmp);
      
    tmp = foo;
    foo = N.find("o", tmp);
    if(foo == -1) {
      ox[1].push_back(N.length() - tmp);      
      break; //owari
    }
    ox[1].push_back(foo - tmp);

    tmp = foo;
  }

  sort(ox[0].begin(),ox[0].end(),greater<int>());
  sort(ox[1].begin(),ox[1].end(),greater<int>());
  //cout << max(ox[1].begin(),ox[1].end());
  int ans = 0;
  // for(N.find("x") != -1){
    
  // }
  ans += ox[1][0] / ox[0][0];
  
  
  rep(i,2) {
    rep(j,ox[i].size()) cout << ox[i][j] << " ";
    cout << endl;
  }
	
}
