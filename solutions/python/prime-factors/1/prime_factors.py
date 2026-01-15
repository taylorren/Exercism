def factors(value):
    res=[]
    n=2
    while n*n <=value:
        if value%n==0:
            res.append(n)
            value=int(value/n)
        else:
            n+=1

    if value>1:
        res.append(value)
    
    return res

