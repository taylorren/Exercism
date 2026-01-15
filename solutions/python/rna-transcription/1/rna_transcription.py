def to_rna(dna_strand):
    res=''
    for dna in dna_strand:
        if dna=='G':
            res+='C'
        elif dna=='C':
            res+='G'
        elif dna=='T':
            res+='A'
        elif dna=='A':
            res+='U'
        else:
            pass
    
    return res       
