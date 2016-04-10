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

int N;
string inp[100];

int main(){
  cin >> N;
  rep(i,N) cin >> inp[i];

  //sort((inp[i]).begin(),(inp[i]).end()); vector
  rep(i,N) reverse(inp[i].begin(),(inp[i]).end()); //array
  
  //sort((inp).begin(),(inp).end()); vector
  sort(inp, inp+N); //array
  rep(i,N) reverse(inp[i].begin(),inp[i].end()); //array
  
  cout << endl;
  rep(i,N) cout << inp[i] << endl;
}
