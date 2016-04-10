//qsort
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

int n;
int a[100];

int sort(int l, int r){
  if(r - l <= 0) return 0;

  int tl = l, tr = r;
  int mid = a[(l+r)/2];
  while(tr - tl > 0){
    cout << "tl:" << tl <<", tr:" << tr << endl;
    
    while(mid < a[tr] && tr >= l) tr--;
    while(a[tl] <= mid && tl <= r) tl++;
    
    cout << "mid:"<< mid <<", a["<< tl <<"]:"<< a[tl] << ", a["<< tr <<"]:" << a[tr] << endl;

    if(tr - tl > 0) break;
    swap(a[tr],a[tl]);
    // tr--;tl++;
  }
  rep(i,n) cout << a[i];
  cout << endl << endl;

  cout << l << ","<< tl <<endl;
  // sort(l, tl);
  sort(l, tr-1);
  cout << tl+1 << ","<< r <<endl;
  // sort(tl+1, r);
  sort(tr, r);
}

int main(){
  cin >> n;
  rep(i,n) cin >> a[i];

  sort(0, n-1);
  
  rep(i,n) cout << a[i];
  cout << endl;
}
