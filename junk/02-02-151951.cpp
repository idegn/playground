//pccb p98
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

#define MAX_V 5
int d[MAX_V][MAX_V] ={
  
  

  };
int V;



int main{

  rep(i,V){    
    rep(j,V){
      rep(k,V){
	d[i][j] = min(d[i][j], d[i][k] + d[k][j]);
      }
    }
  }
    
  
  
  
}
