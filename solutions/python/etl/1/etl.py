def transform(legacy_data):
    result={}
    for point in legacy_data:
        letters=legacy_data[point]
        for letter in letters:
            result[letter.lower()]=point

    return result
