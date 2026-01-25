package thefarm

import (
	"errors"
	"fmt"
)

// DivideFood calculates the amount of fodder per cow
func DivideFood(fodderCalculator FodderCalculator, cows int) (float64, error) {
	totalFodder, err := fodderCalculator.FodderAmount(cows)
	if err != nil {
		return 0, err
	}

	factor, err := fodderCalculator.FatteningFactor()
	if err != nil {
		return 0, err
	}

	return (totalFodder * factor) / float64(cows), nil
}

// ValidateInputAndDivideFood validates the number of cows and then divides the food
func ValidateInputAndDivideFood(fodderCalculator FodderCalculator, cows int) (float64, error) {
	if cows <= 0 {
		return 0, errors.New("invalid number of cows")
	}

	return DivideFood(fodderCalculator, cows)
}

// InvalidCowsError is a custom error type for invalid number of cows
type InvalidCowsError struct {
	numberOfCows  int
	customMessage string
}

// Error implements the error interface for InvalidCowsError
func (e *InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.numberOfCows, e.customMessage)
}

// ValidateNumberOfCows validates the number of cows and returns a custom error if invalid
func ValidateNumberOfCows(cows int) error {
	if cows < 0 {
		return &InvalidCowsError{
			numberOfCows:  cows,
			customMessage: "there are no negative cows",
		}
	}

	if cows == 0 {
		return &InvalidCowsError{
			numberOfCows:  cows,
			customMessage: "no cows don't need food",
		}
	}

	return nil
}
