//pccb p73
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

int N, L, P;
int A[10000],B[10000];

priority_queue<int> pq;
int cnt=0;

int main(){
  cin >> N >> L >> P;
  rep(i,N) cin >> A[i];
  rep(i,N) cin >> B[i];

  int i = 0;
  while(P < L && i < N){
    if(P < A[i]){
      while(P < A[i]){
	if(pq.empty()){
	  cout << -1 << endl;
	  return 0;
	}
	P += pq.top();
	pq.pop();
	cnt++;
      }
    }
    
    pq.push(B[i]);
    i++;
  }

  cout << cnt << endl;
  
}
