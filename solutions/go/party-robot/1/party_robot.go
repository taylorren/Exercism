package partyrobot

import "fmt"

// Welcome greets a person by name.
func Welcome(name string) string {
	var msg = fmt.Sprintf("Welcome to my party, %s!", name)
	return msg
}

// HappyBirthday wishes happy birthday to the birthday person and exclaims their age.
func HappyBirthday(name string, age int) string {
	var msg = fmt.Sprintf("Happy birthday %s! You are now %d years old!", name, age)
	return msg
}

// AssignTable assigns a table to each guest.
func AssignTable(name string, table int, neighbor, direction string, distance float64) string {
	const nl = "\n"
	var l1, l2, l3 string
	l1 = Welcome(name) + nl
	l2 = fmt.Sprintf("You have been assigned to table %03d. Your table is %s, exactly %.1f meters from here.", table, direction, distance) + nl
	l3 = fmt.Sprintf("You will be sitting next to %s.", neighbor)

	return l1 + l2 + l3
}
