//poj 3614
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

#define CMAX 2500
int C,L;
//int cmax[CMAX],cmin[CMAX];
pair<int, pii> cows[CMAX];
//pii lotion[CMAX];
priority_queue<pii> lotion;

int main(){
  cin >> C >> L;
  rep(i,C){
    //cin >> cmax[i] >> cmin[i];
    int tma,tmi;
    cin >> tma >> tmi;
    cows[i] = MP(abs(tma-tmi),MP(tma,tmi));
  }
  rep(i,L){
    int tl,tc;
    cin >> tl >> tc;
    //lotion[i] = MP(tl,tc);
    lotion.push(MP(tl,tc));
  }

  sort(cows, cows+C);
  //sort(lotion, lotion+L);

  rep(i,C){
    
  }
}
