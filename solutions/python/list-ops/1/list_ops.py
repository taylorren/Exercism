def append(list1, list2):
    final_length=len(list1)+len(list2)
    if final_length==0:
        return []
    res=list(range(final_length))
    for index, value in enumerate(list1):
        res[index]=value
    for index, value in enumerate(list2):
        res[index+len(list1)]=list2[index]

    return res

def concat(lists):
    res=[]
    for item in lists:
        if item is None:
            continue
        else:
            res=append(res, item)

    return res

def filter(function, list1):
    res=[]

    for item in list1:
        if function(item) is True:
            res.append(item) # Still using the built-in append. Not perfect
    return res


def length(list1):
    index=0
    while True:
        try:
            _=list1[index]
            index+=1
        except IndexError:
            return index

def map(function, list1):
    if length(list1) ==0:
        return []
    for index, item in enumerate(list1):
        list1[index]=function(item)
    return list1



def foldl(function, list1, initial):
    for elem in list1:
        initial = function(initial, elem)
    return initial


def foldr(function, list1, initial):
    if not list1:
        return initial

    # Recursive case: apply function to last element and remaining list with updated initial value
    return function(list1[-1], foldr(function, list1[:-1], list1[-1]))


def reverse(list1):
    res=[]

    for element in range(length(list1),0,-1):
        res.append(list1[element-1])
    return res
