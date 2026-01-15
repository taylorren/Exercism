"""
Following: https://exercism.org/tracks/python/exercises/rotational-cipher
"""
def rotate(text, key):
    """
    Rotate cypher, the oldest cypto method
    """
    res=''
    for char in text:
        if 'a'<=char<='z':
            new_char=chr((ord(char)+key-ord('a'))%26+ord('a'))
            res+=new_char
        elif 'A'<=char<='Z':
            new_char=chr((ord(char)+key-ord('A'))%26+ord('A'))
            res+=new_char
        else:
            res+=char

    return res
