//atcoder arc 8 b
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

#define all(vec) (vec).begin(),(vec).end()
#define ll long long
#define MP make_pair
#define rep(i,n) REP(i,0,n)
#define REP(i,a,b) for(int i=a;i<b;i++)

#define NM_MAX 50
int N,M;
string shopn;
string kit;

map<char, int> shopmap;
map<char, int> kitmap;

int main(){
  cin >> N >> M;
  cin >> shopn;
  cin >> kit;

  for(int i = 0; i < shopn.length(); i++) shopmap[shopn[i]] = count(all(shopn), shopn[i]);
  for(int i = 0; i < kit.length(); i++) kitmap[kit[i]] = count(all(kit), kit[i]);

  int ans = 1;
  map<char, int>::iterator it = shopmap.begin();
  while( it != shopmap.end() ){
    if(kitmap[(*it).first] == 0){
      ans = -1;
      break
    }
    while((*it).second > kitmap[(*it).first]*ans) ans++;
    it++;    
  }
  
  cout << ans << endl;
  
}
