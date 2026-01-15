"""module to return dart score"""
def score(x, y):
    """module to return dart score"""
    distance=x*x+y*y

    out_ring=10*10
    mid_ring=5*5
    in_ring=1*1
    scores={in_ring: 10, mid_ring: 5, out_ring: 1}

    if distance>out_ring:
        return 0
    if distance>mid_ring:
        return scores[out_ring]
    if distance>in_ring:
        return scores[mid_ring]
    return scores[in_ring]