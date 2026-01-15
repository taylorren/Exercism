import re

def count_words(sentence):
    """Counts the number of words in a given sentence."""
    sentence=sentence.lower()
    sentence=sentence.replace('_', ' ')
    words=re.findall(r"\b\w+'\w+|\b\w+\b", sentence)
    counts={}
    for word in words:
        if word in counts:
            counts[word]+=1
        else:
            counts[word]=1

    return counts
