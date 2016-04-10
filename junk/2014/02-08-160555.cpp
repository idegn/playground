//atcoder arc 15 b
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


#define MAX_N 3650
int N;
double MT[MAX_N],mT[MAX_N];

//int cntM[5] = {0};
//int cntm[3] = {0};

int cnt[6] = {0};

int main(){
  cin >> N;
  rep(i,N) cin >> MT[i] >> mT[i];

  rep(i,N){
    if(MT[i] < 0){
      cnt[5]++;
      continue;
    }

    if(mT[i] < 0) cnt[4]++;
    else if(mT[i] >= 25) cnt[3]++;

    
  }

    
  }  
}
