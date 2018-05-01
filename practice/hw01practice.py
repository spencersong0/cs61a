def gen():
    print ("Starting here")
    i = 0
    while i < 6:
            print("BY")
            yield i
            print("AY")
            i +- 1
return gen
