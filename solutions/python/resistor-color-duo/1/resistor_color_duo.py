"""
This module defines a function to calculate the value of a resistor based on its color code.
"""

colors_list=[
    'black', 'brown', 'red',
    'orange', 'yellow', 'green',
    'blue', 'violet', 'grey',
    'white'
]

def value(colors):
    """
    This function takes a list of colors and returns a value.
    """
    res=''

    value_1=str(colors_list.index(colors[0]))
    value_2=str(colors_list.index(colors[1]))

    res=int(value_1+value_2)
    return res
