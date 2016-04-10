//atcoder arc 11 b
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
//#include <cctype>

using namespace std;

#define all(vec) (vec).begin(),(vec).end()
#define ll long long
#define MP make_pair
#define rep(i,n) REP(i,0,n)
#define REP(i,a,b) for(int i=a;i<b;i++)
#define pii pair<int,int> 
#define pll pair<LL,LL>
#define pis pair<int,string>

int N;
string inp[1000];

map<string,int> ru;

int main(){
  ru["b"]=1;
  ru["c"]=1;
  ru["d"]=2;
  ru["w"]=2;
  ru["t"]=3;
  ru["j"]=3;
  ru["f"]=4;
  ru["q"]=4;
  ru["l"]=5;
  ru["v"]=5;
  ru["s"]=6;
  ru["x"]=6;
  ru["p"]=7;
  ru["m"]=7;
  ru["h"]=8;
  ru["k"]=8;
  ru["n"]=9;
  ru["g"]=9;
  ru["z"]=0;
  ru["r"]=0;
    
  cin >> N;
  rep(i,N) {
    cin >> inp[i];
    transform(inp[i].begin(), inp[i].end(), inp[i].begin(), ::tolower);    
  }

  rep(i,N){
    rep(j,inp[i].length()){
      if(find((string)inp[i][j])){

      }
    }
  }

  ru.find("a");

}
