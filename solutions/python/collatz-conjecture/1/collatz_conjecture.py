def steps(number):
    step=0
    if number<=0:
        raise ValueError("Only positive integers are allowed")

    if number==1: 
        return step
    
    while number!=1:
        step+=1
        if number%2==0:
            number=number/2
        else:
            number =3*number+1

    return step
