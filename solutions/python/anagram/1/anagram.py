def find_anagrams(word, candidates):
    res=[]

    for candidate in candidates:
        if word.lower()==candidate.lower(): # The same word
            continue
        else:
            char_list_word=list(sorted(word.lower()))
            cand_list_word=list(sorted(candidate.lower()))

            if char_list_word==cand_list_word:
                res.append(candidate)
    
    return res


