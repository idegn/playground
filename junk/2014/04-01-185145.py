#euler7
import math
memo = [2] 
def prime():
    i = 3
    while True:
        for j in memo:            
            if i%j == 0:
                break
            elif j >= math.ceil(math.sqrt(i)):
                memo.append(i)
                break
        if len(memo) == 10001:
        # if len(memo) == 6:
            print(memo[-1])
            break;
        i+=1

prime()
