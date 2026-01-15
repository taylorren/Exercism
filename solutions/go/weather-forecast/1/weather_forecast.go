// Package weather is just for testing.
// Though the name suggests it is a weather package.
package weather


var (
	// CurrentCondition good/bad.
	CurrentCondition string 
	// CurrentLocation where you are.
	CurrentLocation  string
)

// Forecast to provide the information.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
