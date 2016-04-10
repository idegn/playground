//atcoder arc 14 c
#include <algorithm>
#include <deque>
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

int N;
string S;

deque<char> deq;

int main(){
  cin >> N >> S;

  deq.push_back(S[0]);
  for(int i = 1; i < N ; i++){
    if(deq.size() == 0) deq.push_back(S[i]);
    else{
      if(S[i] == deq.front()){
	deq.pop_front();
      }else if(S[i] == deq.back()){
	deq.pop_back();
      }else{      
	if(S[i+1] == deq.front()){
	  deq.push_back(S[i+1]);
	}else if(S[i+1] == deq.back()){
	  deq.push_front(S[i+1]);
	}else{
	  deq.push_front(S[i+1]);
	}      
      }
    }
  }

  cout << deq.size() << endl;
  
}

