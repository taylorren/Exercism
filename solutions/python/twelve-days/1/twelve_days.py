verses = [
    "twelve Drummers Drumming, ",
    "eleven Pipers Piping, ",
    "ten Lords-a-Leaping, ",
    "nine Ladies Dancing, ",
    "eight Maids-a-Milking, ",
    "seven Swans-a-Swimming, ", 
    "six Geese-a-Laying, ", 
    "five Gold Rings, ",
    "four Calling Birds, ",
    "three French Hens, ",
    "two Turtle Doves, and ",
    "a Partridge in a Pear Tree."]

seq=[
    'first', 
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth'
]

def recite(start_verse, end_verse):
    return [f"On the {seq[i]} day of Christmas my true love gave to me: "+ "".join(verses[-i-1:]) for i in range(start_verse-1, end_verse)]
