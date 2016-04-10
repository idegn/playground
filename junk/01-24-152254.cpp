//atcoder arc 2 c
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
char inp[1000];
int bm[1000];
map<string, int> o_count;
map<string, int> e_count;

int main(){
  cin >> N;
  for (int i = 0; i < N; i++) {
    cin >> inp[i];
  }

  String inp_s= String.valueOf(inp);
 
  for(int i = 0; i < N/2; i++){    
    string op = inp_s.substr(i, 2)
    string ep = inp_s.substr(i+1, 2);

    if(count[op] == 0){
      o_count.insert( map<string, int>::value_type(op, 1));      
    }else{
      o_count[op]++;
    }
    
    if(count[ep] == 0){
      e_count.insert( map<string, int>::value_type(ep, 1));      
    }else{
      e_count[ep]++;
    }    
  }

  
}
