#euler3
import math
memo = [2]

def prime(n):
    for i in range(3, math.ceil(math.sqrt(n))):
        for j in memo:            
            if i%j == 0:
                break
            elif j >= math.ceil(math.sqrt(i)):
                memo.append(i)
                break                

#n = 600851475143
n = 13195
prime(n)
max
for i in memo:
    if n%i == 0:
       max = i 

print(max)
