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

#define N_MAX 10001

int N,L,P;
int A[N_MAX],B[N_MAX];

priority_queue<int> pq;
int cnt = 0;

int main(){
  cin >> N >> L >> P;
  rep(i, N) cin >> A[i];
  rep(i, N) cin >> B[i];

  N++;
  A[N] = L;
  B[N] = 0;

  rep(i,N){
    if(A[i] > P){
      while(A[i] > P && !pq.empty()){
	P += pq.top(); pq.pop();
	cnt++;
      }
      if(A[i] > P && pq.empty()){
	cout << -1 << endl;
      }
    }
    pq.push(B[i]);
  }

  cout << cnt << endl;
  
}
