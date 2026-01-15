def convert(number):
    res=''

    if number %3 * number %5 * number %7 !=0: # number has no factors in 3/5/7
        return str(number)

    if number%3==0: 
        res+='Pling'
    if number%5==0:
        res+='Plang'
    if number%7==0:
        res+='Plong'        

    return res