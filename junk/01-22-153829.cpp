//atcoder arc 1 a
#include <algorithm>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;

int main(){
  int n;
  string answer;
  int count[4] = {0};
  int tmp;
    
  //cin >> n;
  n = 9;
  //cin >> answer;
  answer = "131142143";
  
  for(int i = 0; i < n; i++){
    tmp = answer[i] - '1';
    count[tmp]++;
  }

  for(int i = 0; i < 4; i++){
    cout << count[i] << endl;
  }
  
}
