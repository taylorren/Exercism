package lasagna

// PreparationTime returns the preparation time based on number of layers.
// If timePerLayer is 0, a default of 2 minutes per layer is used.
func PreparationTime(layers []string, timePerLayer int) int {
	if timePerLayer == 0 {
		timePerLayer = 2
	}
	return len(layers) * timePerLayer
}

// Quantities returns the amount of noodles (in grams) and sauce (in liters)
// needed for the given layers.
func Quantities(layers []string) (int, float64) {
	noodles := 0
	sauce := 0.0

	for _, layer := range layers {
		switch layer {
		case "noodles":
			noodles += 50
		case "sauce":
			sauce += 0.2
		}
	}

	return noodles, sauce
}

// AddSecretIngredient replaces the last item in myList with the last item
// from friendsList.
func AddSecretIngredient(friendsList, myList []string) {
	if len(friendsList) == 0 || len(myList) == 0 {
		return
	}
	myList[len(myList)-1] = friendsList[len(friendsList)-1]
}

// ScaleRecipe scales a recipe from 2 portions to the requested number of portions.
// It returns a new slice and does not modify the input slice.
func ScaleRecipe(quantities []float64, portions int) []float64 {
	scaled := make([]float64, len(quantities))
	factor := float64(portions) / 2.0
	for i, q := range quantities {
		scaled[i] = q * factor
	}
	return scaled
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
