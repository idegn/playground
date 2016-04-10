//atcoder arc 1 c
#include <algorithm>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;

char t[8][8];

void markDefa(){
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if(t[i][j] == 'Q'){
	//tate yoko	
	for(int k = 0; k < 8; k++){
	  t[i][k] = 'X';
	  t[k][j] = 'X';
	}
	//hidari ue
	for(int k = 0; i-k >= 0 && j-k >=0; k++ ){
	  t[i-k][j-k] = 'X';
	}
	//hidari shita
	for(int k = 0; i+k < 8 && j-k >=0; k++ ){
	  t[i+k][j-k] = 'X';
	}
	//migi ue
	for(int k = 0; i-k >= 0 && j+k < 8; k++ ){
	  t[i-k][j+k] = 'X';
	}
	//migi shita
	for(int k = 0; i+k < 8 && j+k < 8; k++ ){
	  t[i+k][j+k] = 'X';
	}
      }
    }
  }
  
}

int main(){
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      cin >> t[i][j];
    }
  }

  markDefa();

  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      if(t[i][j] != 'X'){
	
      }
    }
  }
  
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      cout << t[i][j];
    }
    cout << endl;
  }

}
