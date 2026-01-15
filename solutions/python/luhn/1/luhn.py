class Luhn:
    def __init__(self, number):
        # Remove spaces and store the number
        self.number = number.replace(" ", "")
    
    def valid(self):
        # Check if the number is valid according to Luhn's algorithm
        if not self.number.isdigit() or len(self.number) < 2:
            return False
        
        total = 0
        reverse_digits = self.number[::-1]
        
        for i, digit in enumerate(reverse_digits):
            n = int(digit)
            # Double every second digit
            if i % 2 == 1:
                n *= 2
                if n > 9:
                    n -= 9
            total += n
        
        return total % 10 == 0
