//atcoder arc 1 c
#include <algorithm>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;

char t[8][8];
	 
bool isQueen(int i, int j){
  return 0 <= i && i < 8 && 0 <= j && j < 8 && t[i][j] == 'Q';
}

bool check(int i, int j){
  for(int k = 1; k < 8; k++){
    if(isQueen(i+k,j)) return false;
    if(isQueen(i-k,j)) return false;
    if(isQueen(i+k,j+k)) return false;
    if(isQueen(i+k,j-k)) return false;
    if(isQueen(i-k,j+k)) return false;
    if(isQueen(i-k,j-k)) return false;
  }
  return true;
}

bool dfs(int count){
  if(count == 8){
    return true;
  }

  for(int i = 0; i < 8; i++){
    if(isQueen(count, i)){
      if(check(count, i)){
	return dfs(count+1);
      }else{
	return false;
      }
    }
  }

  for(int i = 0; i < 8; i++){
    t[count][i] = 'Q';
    if(check(count, i) && dfs(count+1)){
      return true;
    }
    t[count][i] = '.';
  }

  return false;
  
}

int main(){
  for(int i = 0; i < 8; i++){
    cin >> t[i];
  }

  if(dfs(0)){    
    for(int i = 0; i < 8; i++){
      for(int j = 0; j < 8; j++){
	cout << t[i][j];
      }
      cout << endl;
    }    
  }else{
    cout << "no answer" << endl;
  }
}



