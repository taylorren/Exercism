def square_root(number):
    x=number/2
    while True:
        y=(x+number/x)/2
        if abs(x-y)<1e-6:
            break
        x=y
    
    return round(x,0)
