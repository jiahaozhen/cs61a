def num_eights(x):
    if x > 0:
        if x % 10 == 8:
            return 1 + num_eights(x//10)
        else:
            return num_eights(x//10)
    return 0

def pingpong(n):
    if n == 1:
        return 1
    if n == 2:
        return 2
    if num_eights(n-1) or (n-1)%8 == 0:
        return pingpong(n-2)
    else:
        return 2*pingpong(n-1) - pingpong(n-2)

print(pingpong(50))