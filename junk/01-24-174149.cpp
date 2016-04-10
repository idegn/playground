// atcoder arc 3 b
#include <algorithm>
#include <iostream>
#include <cstdio>
#include <string>
#include <sstream>
#include <cmath>
#include <vector>
#include <set>

using namespace std;

int N;
vector<string> inp;

struct cond{
  bool operator(string& l, string& r) const {
    for(int i = 1; i < min(l.length(), r.length()); i++){
      if(l[l.length()-1] > r[r.length()-1]){
	
      }
    }
  }  
};

int main(){
  cin >> N;
  for (int i = 0; i < N; i++) {
    cin >> inp[i];
  }

}


