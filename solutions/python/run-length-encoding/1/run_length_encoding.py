def decode(string):
    if string=='':
        return ''

    res = ""
    digits = ""
    if string[0].isdigit():
        digits += string[0]
    else:
        res+= string[0]
    for i in range(1, len(string)):
        if string[i].isdigit():
            digits += string[i]
        else:
            if digits == "":
                res+= string[i]
            else:
                n = int(digits)
                res+=string[i]*n
            digits = ""
    
    return res


def encode(string):
    if string=='':
        return ''

    cur_char=string[0]
    cur_count=1

    res=''

    for char in list(string)[1::]:
        if char==cur_char:
            cur_count+=1
        else:
            if cur_count==1:
                res+=cur_char
            else:
                tmp=f'{cur_count}{cur_char}'
                res+=tmp

            cur_char=char
            cur_count=1

    if cur_count==1:
        res+=cur_char
    else:
        tmp=f'{cur_count}{cur_char}'
        res+=tmp

    return res
