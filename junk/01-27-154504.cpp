//atcoder arc 3 c
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

#define REP(i,a,b) for(int i=a;i<b;i++)
#define rep(i,n) REP(i,0,n)
#define all(vec) (vec).begin(),(vec).end()
#define MP make_pair

int N,M;
char c[500][500];
double minMax[500][500] = {0};
queue<pair<int, pair<int,int> > > q; //<t, <x, y> >
pair<int, int> s,g;

int dx[] = {0,1,0,-1};
int dy[] = {1,0,-1,0};

int main(){
  cin >> N >> M;
  rep(i,N) rep(j,M){
    cin >> c[i][j];    
    if(c[i][j] == 's'){
      s = MP(i,j);
      minMax[i][j] = 10;
    }else if(c[i][j] == 'g'){
      g = MP(i,j);
    }
  }

  int x,y,t;
  double cost,t_p;
  pair<int,int> p;
  
  q.push(MP(0,s));
  while(!q.empty()){
    t = q.front().first;
    t_p = pow(0.99, t+1);
    p = q.front().second;
    q.pop();

    rep(i,4){
      x = p.first + dx[i];
      y = p.second + dy[i];
      if(0 <= x && x < N && 0 <= y && y < M){
	if(c[x][y] == 's') continue;
	if(c[x][y] == '#') continue;
	if(c[x][y] == 'g'){
	  cost = minMax[p.first][p.second];
	  if(cost > minMax[x][y]){
	    minMax[x][y] = cost;
	    continue;
	  }
	}
	cost = min((c[x][y]-'0')*t_p, minMax[p.first][p.second]);
	if(cost > minMax[x][y]){
	  minMax[x][y] = cost;	  
	  q.push(MP(t+1,MP(x,y)));
	}
      }
    }
  }

  if(minMax[g.first][g.second] == 0){
    cout << -1 << endl;
  }else{
    printf("%.10f\n", minMax[g.first][g.second]);
  }
   
  
}
