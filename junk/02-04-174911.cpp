//pccb p155
const int MAX_N = 1 << 17;

int n, dat[2*MAX_V - 1];

void init(int n_){
  n = 1;
  while (n < n_) n *= 2; //nより大きい最小の2の累乗

  rep(i, 2*n-1) dat[i] = INT_MAX; //すべてを初期化
}

void update(int k, int a){
  k += n - 1; //節の分を足して葉の添字に
  dat[k] = a;

  while(k>0){
    k = (k-1) /2;
    dat[k] = min(dat[k*2+1], dat[k*2+2]);    
  }
}

int query(int a, int b, int k, int l, int r){
  if(r <= a || b <= l) return INT_MAX; 

  if(a <= l && r <= b) return dat[k];
  else{
    int vl = query(a,b, k*2+1, l, (l+r)/2);
    int vr = query(a,b, k*2+2, (l+r)/2, r);

    return min(vl, vr);
  }

}

//pccb p161
// [1, n]
int bit[MAX_N + 1], n;

int sum(int i){
  int s = 0;
  while(i > 0){
    s += bit[i];
    i -= i & -i;
  }

  return s;
}

void add(int i, int x){
  while(i <= n){
    bit[i] += x;
    i += i& -i;
  }
}
