def sum_of_multiples(limit, multiples):
    result=set()
    for multiple in multiples:
        if multiple==0:
            continue
        increment=multiple
        while multiple<limit:
            result.add(multiple)
            multiple+=increment

    score=sum(result)
    return score
