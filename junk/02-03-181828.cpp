//atcoder arc 10 b
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

int md[] = {0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

int N;
vector<int> h;
int m,d;

int main(){  
  for(int i = 2; i < 367; i++){
    if(i%7 == 0){
      h.push_back(i);
      h.push_back(i+1);
    }
  }

  
  cin >> N;  
  rep(i,N){
    scanf("%d/%d", &m,&d);
    rep(j,m){
      d += md[j];
    }
    auto tmp = find(all(h),d);
    while(tmp != h.end()){
      d++;
      tmp = find(all(h),d);
    }
    h.push_back(d);    
  }

  sort(all(h));

  int opt = 2, cnt;
  for(int i = 0; i < h.size(); i++){

    cnt = 1;
    for(int j = i+1; j < h.size(); j++){
      if(h[i] != h[j]-1){
	break;
      }
      cnt++;
      i=j;
    }
    if(cnt > opt) opt = cnt;
  }

  cout << opt << endl;
}
