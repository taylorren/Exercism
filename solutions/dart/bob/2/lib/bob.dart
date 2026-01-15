class Bob {
  String response(String txt) {
    bool upperconword =
        txt.trim() == txt.toUpperCase() && txt.contains(new RegExp(r'[A-Z]'));

    return txt.trim().isEmpty
        ? "Fine. Be that way!"
        : upperconword && txt.trim().endsWith("?")
            ? "Calm down, I know what I\'m doing!"
            : txt.trim().endsWith("?")
                ? "Sure."
                : upperconword
                    ? "Whoa, chill out!"
                    : "Whatever.";
  }
}
