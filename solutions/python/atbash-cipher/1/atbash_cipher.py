def encode(plain_text):
    res=''
    plain_text=plain_text.lower()
    char_count=0

    for c in plain_text:
        o=ord(c)
        if o==ord(' '):
            continue
        if o<ord('a') or o>ord('z'): #not a character
            if ord('0')<=o<=ord('9'):
                res+=str(c)
                char_count+=1
            else:
                continue
        else:
            res+=shift_char(o)
            char_count+=1

        if char_count==5:
            char_count=0
            res+=' '

    return res.strip()

def decode(ciphered_text):
    res=''
    for c in ciphered_text:
        o=ord(c)
        if c==' ':
            continue
        if ord('0')<=o<=ord('9'):
            res+=str(c)
        else:
            res+=shift_char(o)

    return res

def shift_char(o):
    shift=26-(o-ord('a'))
    new_c=chr(shift+ord('a')-1)
    return new_c
