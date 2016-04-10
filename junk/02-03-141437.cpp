//pccb p75
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

#define L_MAX 50000
int N;
int L[L_MAX];

priority_queue<int, vector<int>, greater<int>> pq;
int ans = 0;

int main(){
  cin >> N;
  rep(i,N){
    cin >> L[i];
    pq.push(L[i]);
  }

  while(pq.size() != 1){
    int f = pq.top(); pq.pop();
    int s = pq.top(); pq.pop();
    int tmp = f+s;
    ans += tmp;    
    pq.push(tmp);
  }
  
  cout << ans << endl;
  
}
