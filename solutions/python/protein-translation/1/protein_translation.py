def proteins(strand):
    res=[]
    for index in range(0, len(strand), 3):
        serie=strand[index:index+3]
        if serie=='AUG':
            res.append('Methionine')
        if serie in ['UUU', 'UUC']:
            res.append('Phenylalanine')
        if serie in ['UUA', 'UUG']:
            res.append('Leucine')
        if serie in ['UCU', 'UCC', 'UCA', 'UCG']:
            res.append('Serine')
        if serie in ['UAU', 'UAC']:
            res.append('Tyrosine')
        if serie in ['UGU', 'UGC']:
            res.append('Cysteine')
        if serie =='UGG':
            res.append('Tryptophan')
        if serie in ['UAA', 'UAG', 'UGA']:
            break


    return res