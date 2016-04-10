//atcoder arc 9 b
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

char b[10];
int N;
string a[777];

struct comp{
  bool operator()(const string& l, const string& r) const {
    return l.length() < r.length();
  }

};
comp c;

void ref(string start, int num){
  swap(start[0],start[num]);
}


int main(){      
  rep(i,10) cin >> b[i];
  cin >> N;
  rep(i,N) cin >> a[i];

  sort(a, a+N, c);

  int i = 0;
  while(i < N){
    int j = i;
    //tigaketaninarumade susumu
    while(a[i].length() == a[j].length() ) j++;
    if(i == j) {
      i++;
      continue;
    }

    //onazi keta
    int cnt = j, tmp = i;    
    for(int k = 0; k < a[i].length(); k++){ // kaku keta
      for(int l = 9; 0 < l; l--){ //subeteno suuzi
	for(int m = i; m < cnt; m++){ // swap sitenai youso
	  if(a[tmp][k] == b[l]){
	    swap(a[tmp], a[cnt]);
	    cnt--;
	  }else{
	    tmp++;
	  }
	}
      }
    }

    
  }
  
  
  rep(i,N) cout << a[i] << endl;
  
}
