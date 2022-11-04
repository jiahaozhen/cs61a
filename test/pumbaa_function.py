def add_one(x):
    return x+1

def nested(f):
    def g(x):
        return f(f(x))
    return g
    
a = nested(nested)(nested)(add_one)(5)
print(a)