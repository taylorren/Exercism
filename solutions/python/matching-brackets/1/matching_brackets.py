def is_paired(input_string):
    stack=[]
    pairs={']':'[', ')':'(', '}':'{'}

    for c in input_string:
        if c in pairs.values():
            stack.append(c)
        elif c in pairs.keys():
            if len(stack)==0 or stack.pop()!=pairs[c]:
                return False
    
    return len(stack)==0
