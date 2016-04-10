//atcoder arc 1 d
#include <algorithm>
#include <iostream>
#include <string>
#include <sstream>
#include <cmath>

using namespace std;

int N;
double st,go;
double l[200000],r[200000];


int main(){
  cin >> N;
  cin >> st >> go;
  for(int i = 0; i < N+1; i++){
    cin >> l[i] >> r[i];
  }

  double tend;
  double pos;
  double tmp_go = go;
  double tmp_st = st;
  int temp_N = N;
  double total;
  for(int i = 0; i <= N; i++){
    tend = (tmp_go - tmp_st) / tmp_N;
    for(int j = i+1; j <= N; j++){
      pos = tend * j + tmp_st;
      if(pos < l[j] && r[j] < pos){
	if(hypot(j-i, l[j]-tmp_st) > hypot(j-i, r[j]-tmp_st)){
	  total += hypot(j-i, r[j]-tmp_st);
	  tmp_st = r[j];
	}else{
	  total += hypot(j-i, l[j]-tmp_st);
	  tmp_st = l[j];
	}
	i = j;
	break;	
      }

      //最後までぶつからない
      if(hypot(j-i, l[j]-tmp_st) > hypot(j-i, r[j]-tmp_st)){
	total += hypot(j-i, r[j]-tmp_st);
	tmp_st = r[j];
      }else{
	total += hypot(j-i, l[j]-tmp_st);
	tmp_st = l[j];
      }
      
    }
  }
  
  
  // cout << N << endl;
  // cout << st << " " << go << endl;
  // for(int i = 0; i < N+1; i++){
  //   cout << l[i] << " " << r[i] << endl;
  // }
  
}
