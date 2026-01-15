def slices(series, length):
    if length==0:
        raise ValueError("slice length cannot be zero")
    if length<0:
        raise ValueError("slice length cannot be negative")

    end=len(series)
    if end==0:
        raise ValueError("series cannot be empty")

    res=[]

    if end==1:
        res.append(series)
        return res
    if length>end:
        raise ValueError("slice length cannot be greater than series length")

    for start in range(0,end-length+1):
        tmp=series[start:start+length]
        res.append(tmp)

    return res
