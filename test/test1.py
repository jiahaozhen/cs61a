# def if_function(condition, true_result, false_result):
#     if condition:
#         return true_result
#     else:
#         return false_result

# def with_if_statement():
#     if cond():
#         return true_func()
#     else:
#         return false_func()

# def with_if_function():
#     return if_function(cond(), true_func(), false_func())

# def cond():
#     "*** YOUR CODE HERE ***"
#     return False
# def true_func():
#     "*** YOUR CODE HERE ***"
#     print(42)
# def false_func():
#     "*** YOUR CODE HERE ***"
#     print(47)

# with_if_function()#execute the three parameter function when it's called
# print('-'*10)
# with_if_statement()

def hailstone(n):
    """Print the hailstone sequence starting at n and return its
    length.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    "*** YOUR CODE HERE ***"
    print(n)
    i=1
    while(n!=1):
        if n%2 == 0:
            n = n//2
        else:
            n = n*3+1
        print(n)
        i=i+1
    return i

hailstone(10)