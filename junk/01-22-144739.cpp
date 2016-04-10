#include <algorithm>
#include <iostream>

using namespace std;

int n = 4;
int a[4] = {4, 5, 10, 20};

int main(){
  sort(a, a + n);

  int max = 0;
  int tmp;
    
  for(int i=0; i < n; i++){
    for(int j=i+1; j < n; j++){
      for(int k=j+1; k < n; k++){
	if(a[i]+a[j] > a[k]){	  
	  tmp = a[i]+a[j]+a[k];
	  if(max < tmp){
	    max = tmp;
	  }
	}
      }
    }
  }

  cout << max << endl;
}
