//atcoder arc 6 b
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

int N,L;
string t[20];

string g;

int main(){
  scanf("%d %d\n", &N,&L);
  rep(i,L) getline(cin,t[i]);    
  getline(cin, g);


  //rep(i,L) cout << t[i] << endl;

  
  int pos;
  pos = g.find('o');
  //cout << cnt << endl;

  //cout << t[0].length() << endl;
  for(int i = L-1; 0 <= i; i--){
    if(0<=pos-1 && t[i][pos-1] == '-'){
      pos-=2;
    }else if(pos+1<t[i].length() && t[i][pos+1] == '-'){
      pos+=2;
    }
  }

  cout << pos/2+1 << endl;
  

  
}
