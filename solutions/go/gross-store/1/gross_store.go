package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	var result = map[string]int{}
	result["quarter_of_a_dozen"] = 3
	result["half_of_a_dozen"] = 6
	result["dozen"] = 12
	result["small_gross"] = 120
	result["gross"] = 144
	result["great_gross"] = 1728

	return result
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	var result = map[string]int{}
	return result
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	qty, exists := units[unit]
	if !exists {
		return false
	}
	bill[item] += qty
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	qty, unitExists := units[unit]
	if !unitExists {
		return false
	}
	currentQty, itemExists := bill[item]
	if !itemExists {
		return false
	}
	if currentQty < qty {
		return false
	}
	bill[item] -= qty
	if bill[item] == 0 {
		delete(bill, item)
	}
	return true
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	qty, exists := bill[item]
	return qty, exists
}
