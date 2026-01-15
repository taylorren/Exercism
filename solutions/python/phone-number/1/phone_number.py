class PhoneNumber:
    def __init__(self, number):
        # Remove all non-digit characters and whitespace
        digits = ''.join(char for char in number if char.isdigit())
        
        # Check for letters
        if any(char.isalpha() for char in number):
            raise ValueError("letters not permitted")
            
        # Check for punctuation (excluding spaces, dots, parentheses, and hyphens)
        valid_chars = set(' .()-+')
        if any(char not in valid_chars and not char.isdigit() for char in number):
            raise ValueError("punctuations not permitted")
        
        # Check length
        if len(digits) < 10:
            raise ValueError("must not be fewer than 10 digits")
        if len(digits) > 11:
            raise ValueError("must not be greater than 11 digits")
            
        # Handle 11-digit numbers
        if len(digits) == 11:
            if digits[0] != '1':
                raise ValueError("11 digits must start with 1")
            digits = digits[1:]
            
        # Check area code
        if digits[0] == '0':
            raise ValueError("area code cannot start with zero")
        if digits[0] == '1':
            raise ValueError("area code cannot start with one")
            
        # Check exchange code
        if digits[3] == '0':
            raise ValueError("exchange code cannot start with zero")
        if digits[3] == '1':
            raise ValueError("exchange code cannot start with one")
            
        self.number = digits
        
    @property
    def area_code(self):
        return self.number[:3]
        
    def pretty(self):
        return f"({self.number[:3]})-{self.number[3:6]}-{self.number[6:]}"
