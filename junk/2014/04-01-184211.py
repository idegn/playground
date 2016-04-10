#euler6
def squ_no_sum(n):
    ans = 0
    for i in range(1,n+1):
        ans += i*i
    return ans


def sum_no_squ(n):
    ans = 0
    for i in range(1,n+1):
        ans += i
    return ans*ans

n = 100
print(sum_no_squ(n) - squ_no_sum(n))
