def count_coins(total):
    if total == 0:
        return 1
    if total < 0:
        return 0
    return count_coins(total-1) + count_coins(total-5) + count_coins(total-10) + count_coins(total-25)

print(count_coins(15))