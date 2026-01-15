def label(colors):
    colors_list=[
        'black', 'brown', 'red',
        'orange', 'yellow', 'green',
        'blue', 'violet', 'grey',
        'white'
    ]

    digits=colors[0:3]
    value1=digits[0]
    value2=digits[1]
    suffix=digits[2]

    value=int(str(colors_list.index(str(value1)))+str(colors_list.index(str(value2))))
    multiplier=pow(10, colors_list.index(str(suffix)))
    final_value=value*multiplier

    if 0<=final_value<1000:
        return str(final_value)+' ohms'
    
    if 1000<=final_value<1000000:
        return str(int(final_value/1000))+' kiloohms'

    if 1000000<=final_value<1000000000:
        return str(int(final_value/1000000))+' megaohms'
    
    return str(int(final_value/1000000000))+' gigaohms'



