def transpose(text):
    if not text:
        return ""
    
    # Split input into lines
    lines = text.split('\n')
    
    # For a single line, return each character on its own line
    if len(lines) == 1:
        return '\n'.join(lines[0])
    
    # Find the maximum line length
    max_len = max(len(line) for line in lines)
    
    # Transpose the text
    result = []
    for col in range(max_len):
        transposed_line = ''
        for row in range(len(lines)):
            # Add character if it exists in the original line
            if col < len(lines[row]):
                transposed_line += lines[row][col]
            # Add space if there are more characters to come in later rows
            elif any(col < len(line) for line in lines[row+1:]):
                transposed_line += ' '
        result.append(transposed_line)
    
    return '\n'.join(result)