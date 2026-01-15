"""
This module contains a function to generate proverbs based on a list of items.
"""

def proverb(*items, qualifier=None):
    if not items:
        return []

    # Create the list of proverbs based on the items
    proverbs = [
        f"For want of a {items[i]} the {items[i + 1]} was lost."
        for i in range(len(items) - 1)
    ]

    # Add the final line with the optional qualifier
    if qualifier:
        proverbs.append(f"And all for the want of a {qualifier} {items[0]}.")
    else:
        proverbs.append(f"And all for the want of a {items[0]}.")

    return proverbs
