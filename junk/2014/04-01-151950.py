#euler1
def three_or_five(n):
    cnt = 0
    for i in range(n):
        if i%3 == 0 or i%5 == 0:
           cnt += i
    return cnt

print(three_or_five(1000))
