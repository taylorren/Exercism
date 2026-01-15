def is_valid(isbn):
    isbn=isbn.replace("-", "")
    if len(isbn)!=10:
        return False
    
    sum=0
    for index in range(0,9):
        digit=ord(isbn[index])-ord('0')
        if digit<0 or digit >9:
            return False
        
        sum+=digit*(10-index)


    if isbn[9]=='X':
        sum+=10
    else:
        digit=ord(isbn[9])-ord('0')
        if digit<0 or digit >9:
            return False
        sum+=digit

    return sum%11==0



