"""
The final resistor exercise
https://exercism.org/tracks/python/exercises/resistor-color-expert
"""

labels=[
    'black', 'brown', 'red',
    'orange', 'yellow', 'green',
    'blue', 'violet', 'grey',
    'white'
]

tolerance={
    'grey': 0.05, 
    'violet': 0.1,
    'blue': 0.25,
    'green': 0.5,
    'brown': 1,
    'red': 2,
    'gold': 5, 
    'silver': 10
}

def resistor_label(colors):
    res=''
    if len(colors)==1:
        return '0 ohms'

    if len(colors)==4: # 4 color band
        res=do_4_colors(colors)
    else:
        res=do_5_colors(colors)

    return res

def do_4_colors(colors):
    value1=labels.index(colors[0])
    value2=labels.index(colors[1])
    multi=labels.index(colors[2])
    toler=tolerance[colors[3]]

    value=int(value1)*10+int(value2)
    res=f'{do_find_value(value, multi)} ±{toler}%'
    return res


def do_5_colors(colors):
    value1=labels.index(colors[0])
    value2=labels.index(colors[1])
    value3=labels.index(colors[2])

    multi=labels.index(colors[3])
    toler=tolerance[colors[4]]

    value=int(value1)*100+int(value2)*10+int(value3)
    res=f'{do_find_value(value, multi)} ±{toler}%'
    return res

def do_find_value(value, multi):
    """
    Do the calculation and string format
    """
    final_value=value*pow(10, multi)
    if 0<=final_value<1000:
        return str(final_value)+' ohms'

    if 1000<=final_value<1000000:
        tmp_res=final_value/1000
        if tmp_res==int(tmp_res):
            res=int(tmp_res)
        else:
            res=tmp_res

        return str(res)+' kiloohms'

    if 1000000<=final_value<1000000000:
        tmp_res=final_value/1000000
        if tmp_res==int(tmp_res):
            res=int(tmp_res)
        else:
            res=tmp_res

        return str(res)+' megaohms'

    return str(final_value/1000000000)+' gigaohms' 
    # I did not do the final checking as for the previous two cases
