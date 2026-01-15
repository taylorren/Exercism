def score(x, y):
    distance=x*x+y*y

    OUT=10*10
    MID=5*5
    IN=1*1
    scores={IN: 10, MID: 5, OUT: 1}

    if distance>OUT:
        return 0
    if distance>MID:
        return scores[OUT]
    if distance>IN:
        return scores[MID]
    
    return scores[IN]

    



