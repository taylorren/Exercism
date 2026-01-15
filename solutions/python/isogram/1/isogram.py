def is_isogram(string):
    if string=='':
        return True
    
    string=string.lower()
    appears=[False]*26

    for char in string:
        index=ord(char)-ord('a')
        if index<0 or index>26:
            continue

        if appears[index] is True:
            return False
        else: 
            appears[index]=True

    return True
