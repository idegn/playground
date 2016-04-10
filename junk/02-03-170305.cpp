//pccb p
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
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>

#define N_MAX 100000
int n,S;
int a[N_MAX];

int main(){
  cin >> n >> S;
  rep(i,n) cin >> a[i];

  int sum = 0;
  int i;
  for(i = 0;i < n && sum < S; i++){
    sum += a[i];
  }

  if(sum < S) cout << 0 << endl;

  int ans = i+1;

  cout << ans << endl;
  
  int opt = ans;
  int j = 0;

  while(j < n){
    while(S <= sum && j < i){
      sum -= a[j];
      ans--;
      j++;
    }
    cout << "j inc " <<j << " " << i << " " << sum << " " << ans << endl;
    if(opt > ans) opt = ans;
    
    while(sum < S && i < n){
      sum += a[i];
      ans++;
      i++;
    }
    if(sum < S) break;
    if(opt > ans) opt = ans;
    cout << "i inc " << j << " " << i << " " << sum << " " << ans << " " << opt << endl;
    j++;
    //cout << ans << " ";
  }

  
  cout << opt << endl;
  
}
