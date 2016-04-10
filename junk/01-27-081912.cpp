//atcoder abc 3 c
#include <algorithm>
#include <iostream>
#include <set>
#include <sstream>
#include <string>
#include <vector>

#include <cmath>
#include <cstdio>

using namespace std;

#define REP(i,a,b) for(int i=a;i<b;i++)
#define rep(i,n) REP(i,0,n)
#define all(vec)  (vec).begin(),(vec).end()

int N,M;
char c[500][500];

//pow(0.99, t);

int main(){
  cin >> N >> M;
  rep(i,N){
    rep(j,M) cin >> c[i][j];
  }

  bool dame_map[500][500];
  int px,py;
  pair<double, pair<int,int>> 

    
  
  // int px,py;
  // int t_min,tmp;
  // int t;
  // double t_pow;
  // vector<int, int, vector<int,int,double>> 
  // while(){
  //   t_min = 10;
  //   t_pow = pow(0.99 ,t);
  //   if(0 <= px-1 && px-1 < N){
  //     if(t_min > tmp=(c[px-1][py]-'0')*t_pow) t_min = tmp;
  //   }
  //   if(0 <= px+1 && px+1 < N){
  //     if(t_min > tmp=(c[px+1][py]-'0')*t_pow) t_min = tmp;
  //   }
  //   if(0 <= py-1 && py-1 < N){
  //     if(t_min > tmp=(c[px][py-1]-'0')*t_pow) t_min = tmp;
  //   }
  //   if(0 <= px+1 && px+1 < N){
  //     if(t_min > tmp=(c[px][py+1]-'0')*t_pow) t_min = tmp;    
  //   }   
  // }
}
