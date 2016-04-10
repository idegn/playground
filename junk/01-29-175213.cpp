//pccb p49
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

int N;
vector<int> le;

int cost=0;

int tmp;

int main(){
  cin >> N;
  rep(i, N){
    cin >> tmp;
    le.push_back(tmp);
  }  

  while(le.size() > 1){    
    sort(le.begin(), le.end());
    le[1] += le[0];
    cost+= le[1];
    le.erase(le.begin());    
  }

  cout << cost << endl;
}
