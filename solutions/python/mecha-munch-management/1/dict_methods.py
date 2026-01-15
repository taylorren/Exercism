"""Functions to manage a users shopping cart items."""


def add_item(current_cart, items_to_add):
    """Add items to shopping cart.

    :param current_cart: dict - the current shopping cart.
    :param items_to_add: iterable - items to add to the cart.
    :return: dict - the updated user cart dictionary.
    """
    current_keys = current_cart.keys()
    for item in items_to_add:
        if item in current_keys:
            current_cart[item] += 1
        else:
            current_cart.setdefault(item, 1)
    
    return current_cart
    


def read_notes(notes):
    """Create user cart from an iterable notes entry.

    :param notes: iterable of items to add to cart.
    :return: dict - a user shopping cart dictionary.
    """
    cart = {}
    for note in notes:
        cart.setdefault(note, 1)
    return cart

def update_recipes(ideas, recipe_updates):
    """Update the recipe ideas dictionary.

    :param ideas: dict - The "recipe ideas" dict.
    :param recipe_updates: dict - dictionary with updates for the ideas section.
    :return: dict - updated "recipe ideas" dict.
    """
    new_recipe = dict(recipe_updates)
    new_ideas = ideas | new_recipe
    return new_ideas

def sort_entries(cart):
    """Sort a users shopping cart in alphabetically order.

    :param cart: dict - a users shopping cart dictionary.
    :return: dict - users shopping cart sorted in alphabetical order.
    """
    return dict(sorted(cart.items()))
    


def send_to_store(cart, aisle_mapping):
    """Combine users order to aisle and refrigeration information.

    :param cart: dict - users shopping cart dictionary.
    :param aisle_mapping: dict - aisle and refrigeration information dictionary.
    :return: dict - fulfillment dictionary ready to send to store.
    """
    final_info={}
    for item, quantity in cart.items():
        [location, ref]=aisle_mapping[item]
        final_info.setdefault(item, [quantity, location, ref])
    final_info=dict(sorted(final_info.items()))
    return reversed(final_info.items())


def update_store_inventory(fulfillment_cart, store_inventory):
    """Update store inventory levels with user order.

    :param fulfillment cart: dict - fulfillment cart to send to store.
    :param store_inventory: dict - store available inventory
    :return: dict - store_inventory updated.
    """
    for item, qty in fulfillment_cart.items():
        stock=store_inventory[item]
        balance=stock[0]-qty[0]
        if balance==0:
            store_inventory[item][0]='Out of Stock'
        else:
            store_inventory[item][0]=balance
        
    return store_inventory
   
        

