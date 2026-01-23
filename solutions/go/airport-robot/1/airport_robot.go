package airportrobot

import "fmt"

// Greeter describes a type that can greet a visitor in a specific language.
type Greeter interface {
	LanguageName() string
	Greet(name string) string
}

// SayHello returns a greeting that includes the language name.
func SayHello(name string, greeter Greeter) string {
	return fmt.Sprintf("I can speak %s: %s", greeter.LanguageName(), greeter.Greet(name))
}

// Italian implements Greeter for Italian greetings.
type Italian struct{}

func (Italian) LanguageName() string { return "Italian" }

func (Italian) Greet(name string) string { return fmt.Sprintf("Ciao %s!", name) }

// Portuguese implements Greeter for Portuguese greetings.
type Portuguese struct{}

func (Portuguese) LanguageName() string { return "Portuguese" }

func (Portuguese) Greet(name string) string { return fmt.Sprintf("Olá %s!", name) }
