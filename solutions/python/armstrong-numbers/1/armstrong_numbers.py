def is_armstrong_number(number):
    if number==0:
        return True
    
    num_str=str(number)
    length=len(num_str)
    sum=0
    for digit in list(num_str):
        sum+=pow(int(digit), length)

    return sum==number

