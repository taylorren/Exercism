def flatten(iterable):
    res=[]
    for element in iterable:
        if element is not None:
            if isinstance(element, list):
                res+=flatten(element)
            else:
                res+=[element]

    return res
