//atcoder arc 14 b
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

#define all(vec) (vec).begin(),(vec).end()
#define ll long long
#define MP make_pair
#define rep(i,n) REP(i,0,n)
#define REP(i,a,b) for(int i=a;i<b;i++)
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>

#define MAX_W 100

int N;
string w[MAX_W];

map<string, int> cnt;


int main(){
  cin >> N;
  rep(i,N) cin >> w[i];

  int i;
  cnt[w[0]] = 1;
  for(i = 1; i < N; i++){
    if(cnt[w[i]] == 1 || w[i][0] != w[i-1][w[i-1].size()-1]){
      if(i%2 == 0){
	cout << "WIN" << endl;
	break;
      }else{
	cout << "LOSE" << endl;
	break;
      }
    }
    cnt[w[i]] = 1;
  }

  cout << w[0][-1] << endl;
  if(i == N) cout << "DRAW" << endl;
}
