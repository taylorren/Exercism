def is_pangram(sentence):
    sentence=sentence.lower()
    appears=[False]*26

    for char in set(sentence.lower()):
        index=ord(char)-ord('a')
        if index<0 or index>26:
            continue
        appears[index]=True

    return all(char==True for char in appears)
