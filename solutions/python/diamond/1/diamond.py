def rows(letter):
    char='A'
    ord_a=ord(char)
    ord_letter=ord(letter)

    res=[]

    # Expanding
    for current in range(ord_a, ord_letter+1):
        current_letter=chr(current)
        space_begin=ord_letter-current
        space_end=space_begin
        space_between=2*(current-ord_a)-1
        if current==ord_a: # The first line
            line=f'{" "*space_begin}{current_letter}{" "*space_end}'
        else:
            line=f'{" "*space_begin}{current_letter}{" "*space_between}{current_letter}{" "*space_end}'
        
        res.append(line)
    
    # Shrinking
    for current in range(ord_letter-1, ord_a-1, -1):
        current_letter=chr(current)
        space_begin=ord_letter-current
        space_end=space_begin
        space_between=2*(current-ord_a)-1
        if current==ord_a: # The first line
            line=f'{" "*space_begin}{current_letter}{" "*space_end}'
        else:
            line=f'{" "*space_begin}{current_letter}{" "*space_between}{current_letter}{" "*space_end}'
        
        res.append(line)
    


    return res






