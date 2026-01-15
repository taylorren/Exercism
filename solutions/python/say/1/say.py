units=['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
tens=['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
ten_multis=['zero','ten','twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']

def say(number):
    if not 0<=number<1_000_000_000_000:
        raise ValueError('input out of range')

    if number==0:
        return 'zero'

    if number<=999:
        ten=number % 100
        hundred=number-ten

        if hundred==0: # Just need to say two digits
            sayings=say_final_two(ten)
        else:
            if ten!=0:
                sayings=f'{units[int(hundred/100)]} hundred {say_final_two(ten)}'
            else:
                sayings=f'{units[int(hundred/100)]} hundred'
    elif number<=999_999:
        last3=number%1000
        thousands=int((number-last3)/1000)
        if last3==0:
            sayings=f'{say(thousands)} thousand'
        else:
            sayings=f'{say(thousands)} thousand {say(last3)}'
    elif number<=999_999_999:
        last3=number%1000
        mid3=int((number-last3)/1000%1000)
        first3=int((number)/1_000_000)
        if last3==0 and mid3==0:
            sayings=f'{say(first3)} million'
        else:
            sayings=f'{say(first3)} million {say(mid3)} thousand {say(last3)}'
    elif number<=999_999_999_999:
        last3=number%1000
        mid3=int((number-last3)/1000%1000)
        second_mid3=int((number/1_000_000)%1000)
        first3=int((number)/1_000_000_000)

        if last3==0 and mid3==0 and second_mid3==0:
            sayings=f'{say(first3)} billion'
        else:
            sayings=f'{say(first3)} billion {say(second_mid3)} million {say(mid3)} thousand {say(last3)}'


    return sayings

def say_final_two(ten):
    if ten<=9: # Just need to say one digit
        sayings=units[ten]
    elif ten<=19:
        sayings=tens[ten-10]
    else:
        digit1=ten%10
        digit2=ten-digit1
        if digit1==0: # a whole two digits
            sayings=ten_multis[int(digit2/10)]
        else:
            sayings=f'{ten_multis[int(digit2/10)]}-{units[digit1]}'

    return sayings
