import random
import string
import time

class Robot:
    def __init__(self):
        self.reset()

    def reset(self):
        random.seed(time.time())  # Seed with current time to ensure different names
        self.name = ''.join(random.choices(string.ascii_uppercase, k=2)) + ''.join(random.choices(string.digits, k=3))
