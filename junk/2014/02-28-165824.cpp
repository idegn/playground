//poj 3176
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

int N;
vector<int> pin[350];
int S[350][350];

int main(){
  cin >> N;
  rep(i,N){
    rep(j,i+1){
      int tmp;
      cin >> tmp;
      pin[i].push_back(tmp);
    }
  }

  rep(i,N) S[N-1][i] = pin[N-1][i];

  for(int i = N-2; 0 <= i; i--){
    rep(j,i+1){
      S[i][j] = max(S[i+1][j], S[i+1][j+1]) + pin[i][j];
    }
  }

  rep(i,N){
    rep(j,i+1){
      cout << S[i][j] << " ";      
    }
    cout << endl;
  }

  cout << S[0][0] << endl;
}
