def commands(binary_str):
    results=[]

    if binary_str[4] =='1':
        results.append('wink')
    if binary_str[3] =='1':
        results.append('double blink')
    if binary_str[2] =='1':
        results.append('close your eyes')
    if binary_str[1] =='1': 
        results.append('jump')

    if binary_str[0] == '1':
        results = list(reversed(results))

    return results


    


    