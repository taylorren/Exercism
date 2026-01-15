package techpalace

import (
	"strings"
)

// WelcomeMessage returns a welcome message for the customer.
func WelcomeMessage(customer string) string {
	var msg string
	msg = "Welcome to the Tech Palace, " + strings.ToUpper(customer)

	return msg
}

// AddBorder adds a border to a welcome message.
func AddBorder(welcomeMsg string, numStarsPerLine int) string {
	var msg string
	msg = strings.Repeat("*", numStarsPerLine)
	msg += "\n" + welcomeMsg + "\n"
	msg += strings.Repeat("*", numStarsPerLine)

	return msg
}

// CleanupMessage cleans up an old marketing message.
func CleanupMessage(oldMsg string) string {
	lines := strings.Split(oldMsg, "\n")
	middle := lines[1]
	clean := strings.Trim(middle, "*")
	return strings.TrimSpace(clean)
}
