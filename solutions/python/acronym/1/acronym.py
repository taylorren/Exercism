def abbreviate(words):
    res=''
    words=words.replace('-', ' ')
    words=words.replace('_', ' ')

    for word in words.split(' '):
        if word=='': 
            continue
        res+=word[0].upper()
    
    return res
