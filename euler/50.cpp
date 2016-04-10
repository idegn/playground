#include <algorithm>
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

int primes[1000000];
bool memo[1000000];
int N = 1000000;

int calc_primes(){
  int count = 0;

  fill_n(memo, N, true);
  
  for(int i = 2; i < N; i++){
    
    if(memo[i] == true){
      primes[count] = i;
      count++;
      
      for(int j = 2; i*j < N; j++){
	memo[i*j] = false;
      }
    }
    
  }

  return count;
}

// rubyの愚直が遅かったので、ちょっと枝刈りしたの考えて実装しようとしてたけど、
// 途中で愚直やってみたらすでに100倍早かったので萎えた

int main(){
   int LIMIT = 1000000;
  //int LIMIT = 100;
  
  int n = calc_primes();

  
  int sum = 2, count = 1;
  int provisional[2] = {2, 1};
  int j = 1;
  for(int i = 0; i < n; i++){

    // sum = primes[i];
    // count = 1;    
    // for(j = i+1; j < n; j++){
    for( ; j < n; j++){
      if(sum + primes[j] > LIMIT) break;

      
      sum += primes[j];
      count++;

      if(memo[sum] == true && count > provisional[1]){
	provisional[0] = sum;
	provisional[1] = count;
      }
    }

    sum -= primes[i];
    count--;

    while(count > provisional[1]){
      if(memo[sum] == true){
    	provisional[0] = sum;
    	provisional[1] = count;
      }

      sum -= primes[--j];
      count--;
    }
    
  }

  cout << provisional[0] << " : " << provisional[1] << endl;
}
