#euler4
memo = []

def palindrome(n):
    s = str(n)
    for i in range(int(len(s)/2)):
        if s[i] != s[-i-1]:
            return False
            
    return True

def comb_mult(n):
    for i in range(int(n/10), n):
        for j in range(i, n):
            mul = i*j
            # if mul not in memo: #これあると終わらない
            memo.append(mul)

    memo.sort(reverse=True)
    
comb_mult(100)
for i in memo:
    if palindrome(i):
        print(i)
        break
