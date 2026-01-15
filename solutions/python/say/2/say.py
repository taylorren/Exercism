'''
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
'''
# Above is my own codes. Not so elegant so it needs some improvements. 
# Learnt from this: https://exercism.org/tracks/python/exercises/say/solutions/ysf

_say = lambda x: say(x)
ones = lambda x: 'zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen nineteen'.split()[x]
tens = lambda x: 'zero ten twenty thirty forty fifty sixty seventy eighty ninety'.split()[x]
done = lambda f, q, r, t, h: f(q) + t
nope = lambda f, q, r, t, h: f(q) + t + h + say(r)

def say(n):
    if not 0 <= n < 1e12:
        raise ValueError("input out of range")    

    _, d, func, txt, hyphen = list(filter(lambda x: x[0],
        [( n <  20,           1, ones, '',           ''),
         ( n < 1e2,          10, tens, '',          '-'),
         ( n < 1e3,         100, ones, ' hundred',  ' '),
         ( n < 1e6,        1000, _say, ' thousand', ' '),
         ( n < 1e9,     1000000, _say, ' million',  ' '),
         ( n < 1e12, 1000000000, _say, ' billion',  ' ')]))[0]

    q, r = divmod(n, d)
    return {0: done}.get(r, nope)(func, q, r, txt, hyphen)
