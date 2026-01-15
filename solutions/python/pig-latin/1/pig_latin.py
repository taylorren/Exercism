"""
I asked AI to translate my previoud Dart code into Python. 
"""
import re

def translate(text):
    words=text.split(" ")

    translated_words=[]
    for word in words:
        if re.match(r"^(a|e|i|o|u|xr|yt)", word):
            translated_word=word+'ay'
        elif re.match(r"^([^aeiou]*qu)(.*)", word):
            match=re.search(r"([^aeiou]*qu)(.*)", word)
            translated_word=f"{match.group(2)}{match.group(1)}ay"
        elif re.match(r"^([^aeiouy]+)(y.*)", word) or (len(word) == 2 and word.startswith("y")):
            match=re.search(r"^([^aeiouy]*)(y.*)", word)
            translated_word=f"{match.group(2)}{match.group(1)}ay"
        else:
            match = re.search(r"^([^aeiou]+)(.*)", word)
            translated_word = f"{match.group(2)}{match.group(1)}ay"
        
        translated_words.append(translated_word)

    return " ".join(translated_words)



        

