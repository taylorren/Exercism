import re

def response(txt):
    if txt.strip()=='':
         return 'Fine. Be that way!'
    
    if upperconnword(txt) and txt.strip()[-1]=='?':
         return 'Calm down, I know what I\'m doing!'
    
    if txt.strip()[-1]=='?':
         return 'Sure.'
    
    if upperconnword(txt):
         return 'Whoa, chill out!'

    return 'Whatever.'

    


def upperconnword(txt):
     return txt.strip().isupper()
