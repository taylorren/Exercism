def find(search_list, value):
    end=len(search_list)
    if end==0:
        raise ValueError('value not in array')    
    
    start=0
    mid=int(end/2)

    while start<=end:
        if mid>=len(search_list):
            raise ValueError('value not in array')
        
        mid_value=search_list[mid]
        if  mid_value< value:
            start=mid+1
            mid=int((start+end)/2)
        elif mid_value > value: 
            end=mid-1
            mid=int((start+end)/2)
        else: # Found!
            return mid
        
    raise ValueError('value not in array')

        
    

