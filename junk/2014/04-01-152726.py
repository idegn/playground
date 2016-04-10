#euler2
memo = {1:1, 2:2}

def fibo(n):
    if n in memo:
        return memo[n]
    else:
        memo[n] = fibo(n-1) + fibo(n-2)        
        return memo[n]
        
def even_total(n):
    cnt = 0
    i = 1
    while fibo(i) < n:
        if fibo(i)%2 == 0:
            cnt += fibo(i)
        i+=1
    return cnt

print(even_total(4000000))



