package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	var point int
	switch card {
	case "ace":
		point = 11
	case "two":
		point = 2
	case "three":
		point = 3
	case "four":
		point = 4
	case "five":
		point = 5
	case "six":
		point = 6
	case "seven":
		point = 7
	case "eight":
		point = 8
	case "nine":
		point = 9
	case "ten", "jack", "queen", "king":
		point = 10
	}

	return point
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	var score int
	var action string

	if card1 == "ace" && card2 == "ace" {
		action = "P"
	} else {
		score = ParseCard(card1) + ParseCard(card2)
		if score == 21 {
			if ParseCard(dealerCard) != 11 && ParseCard(dealerCard) != 10 {
				action = "W"
			} else {
				action = "S"
			}
		} else if score >= 17 && score <= 20 {
			action = "S"
		} else if score>=12 && score<=16 {
			if(ParseCard(dealerCard)>=7) {
				action="H"
			} else {
				action="S"
			}
		} else {
			action ="H"
		}
	}

	return action
}
