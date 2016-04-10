//pccb p45
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

int N;
string S;

string T = "";
char c;

int main(){
  cin >> N >> S;
  
  int top = 0;
  int last = S.length()-1;
  while(top != last){
    if(S[top] > S[last]){
      T = T + S[last];
      last--;
    }else if(S[top] < S[last]){
      T = T + S[top];
      top++;
    }else{
      string ts = S.substr(top, last-top+1);
      string tsr(ts.rbegin(), ts.rend());
      if(ts > tsr){
	T = T + S[last];
	last--;
      }else{
	T = T + S[top];
	top++;	
      }
    }        
  }

  T = T + S[top];
  
  cout << T << endl;
}
