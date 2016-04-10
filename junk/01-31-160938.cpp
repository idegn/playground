//atcoder arc 5 b
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

enum Dir {R,L,U,D,RU,RD,LU,LD};
int mo[] = {1,0,3,2, 6, 7, 4, 5};

int X,Y;
string W;
char t[9][9];

int main(){
  cin >> X >> Y >> W;
  rep(i,9) rep(j,9) cin >> t[i][j];


  Dir w = R;
  X--;Y--;
  rep(i,4){
    cout << t[X][Y];
    switch(w){
    case R: X++;break;
    case L: X--;break;
    case U: Y++;break;
    case D: Y--;break;
    case RU:X++;Y++;break;
    case RD:X++;Y--;break;
    case LU:X--;Y++;break;
    case LD:X--;Y--;break;      
    }

    if(X < 0 || 9 < X || Y < 0 || 9 < Y){
      

    }
    
    
  
  }
}
