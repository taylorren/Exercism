class Forth {
  List<int> stack = List.empty(growable: true);
  Map<String, String> definedWords = {};

  void evaluate(String statement) {
    statement = statement.toLowerCase();

    final exp = RegExp(r'^:.*;$');
    if (exp.hasMatch(statement)) {
      _addDefinedWord(statement);
      return;
    }

    final expandedStatement = _expandDefinedWords(statement);

    _evaluate(expandedStatement);
  }

  void _evaluate(String statement) {
    final atoms = statement.split(' ');
    atoms.forEach((atom) {
      final parsedAtom = int.tryParse(atom);
      if (parsedAtom != null) {
        stack.add(parsedAtom);
        return;
      }
      _handleOperation(atom);
    });
  }

  String _expandDefinedWords(String statement) {
    definedWords.keys.forEach((word) {
      statement = statement.replaceAll(word, definedWords[word]!);
    });
    return statement;
  }

  void _addDefinedWord(String statement) {
    final atoms = statement.split(' ');
    atoms.removeAt(0);
    atoms.removeLast();
    final word = atoms[0];
    if (int.tryParse(word) != null) {
      throw Exception("Invalid definition");
    }
    for (var i = 0; i < atoms.length; i++) {
      final atom = atoms[i];
      if (definedWords[atom] != null) {
        atoms[i] = definedWords[atom]!;
      }
    }
    atoms.removeAt(0);
    definedWords[word] = atoms.join(' ');
    return;
  }

  void _handleOperation(String operator) {
    switch (operator) {
      case '+':
        _add();
        break;
      case '-':
        _subtract();
        break;
      case '*':
        _multiply();
        break;
      case '/':
        _divide();
        break;
      case 'dup':
        _dup();
        break;
      case 'drop':
        _drop();
        break;
      case 'swap':
        _swap();
        break;
      case 'over':
        _over();
        break;
      default:
        throw Exception('Unknown command');
    }
  }

  void _add() {
    if (stack.isEmpty || stack.length == 1) {
      throw Exception('Stack empty');
    }
    final n1 = stack.removeLast();
    final n2 = stack.removeLast();
    stack.add(n1 + n2);
  }

  void _subtract() {
    if (stack.isEmpty || stack.length == 1) {
      throw Exception('Stack empty');
    }
    final n1 = stack.removeLast();
    final n2 = stack.removeLast();
    stack.add(n2 - n1);
  }

  void _multiply() {
    if (stack.isEmpty || stack.length == 1) {
      throw Exception('Stack empty');
    }
    final n1 = stack.removeLast();
    final n2 = stack.removeLast();
    stack.add(n2 * n1);
  }

  void _divide() {
    if (stack.isEmpty || stack.length == 1) {
      throw Exception('Stack empty');
    }
    final n1 = stack.removeLast();
    final n2 = stack.removeLast();
    if (n1 == 0) {
      throw Exception('Division by zero');
    }
    stack.add(n2 ~/ n1);
  }

  void _dup() {
    if (stack.isEmpty) {
      throw Exception('Stack empty');
    }
    final n = stack.last;
    stack.add(n);
  }

  void _drop() {
    if (stack.isEmpty) {
      throw Exception('Stack empty');
    }
    stack.removeLast();
  }

  void _swap() {
    if (stack.isEmpty || stack.length == 1) {
      throw Exception('Stack empty');
    }

    final n1 = stack.removeLast();
    final n2 = stack.removeLast();
    stack.add(n1);
    stack.add(n2);
  }

  void _over() {
    if (stack.isEmpty || stack.length == 1) {
      throw Exception('Stack empty');
    }
    final n = stack[stack.length - 2];
    stack.add(n);
  }
}
