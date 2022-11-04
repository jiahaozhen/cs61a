def repeat(k):
    return detector(lambda x: False)(k)

def detector(have_seen_i_before):
    def g(i):
        if have_seen_i_before(i):
            print(i)
        return detector(lambda j: j==i or have_seen_i_before(j))
    return g

repeat(1)(7)(7)(1)(1)