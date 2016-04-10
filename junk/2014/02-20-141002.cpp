//aizu 0004
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

double a,b,c,d,e,f;

int main(){
  while(cin >> a){
    cin >> b >> c >> d >> e >> f;
    double x = (c*e-f*b)/(a*e-b*d);
    double y = (c-a*x)/b;

    x = (round(x*1000))/1000;
    y = (round(y*1000))/1000;

    if(x == -0) x = 0;
    if(y == -0) y = 0;
    printf("%.3f %.3f\n", x, y);
  }
}
