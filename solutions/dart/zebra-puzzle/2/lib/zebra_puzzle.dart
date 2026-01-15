final HOUSES = 5;

class ZebraPuzzle {
  final _nations = ['Norwegian', 'English', 'Spanish', 'Ukrainian', 'Japanese'];
  final _colors = ['red', 'green', 'ivory', 'yellow', 'blue'];
  final _pets = ['dog', 'snails', 'fox', 'horse', 'zebra'];
  final _drinks = ['coffee', 'tea', 'milk', 'water', 'juice'];
  final _smokes = [
    'Old Gold',
    'Kools',
    'Chesterfields',
    'Lucky Strike',
    'Parliaments'
  ];

  var solution = List<Map<String, String>>.empty();

  void solve() {
    bool done = false;
    for (var nations in p(_nations)) {
      if (done) break;
      for (var colors in p(_colors)) {
        if (done) break;
        if (!verify(nations, 'English', colors, 'red'))
          continue; // Enforce Condition 2

        for (var pets in p(_pets)) {
          if (done) break;
          if (!verify(nations, 'Spanish', pets, 'dog'))
            continue; // Enforce Condition 3
          for (var drinks in p(_drinks)) {
            if (done) break;
            if (!verify(drinks, 'coffee', colors, 'green'))
              continue; //Enforce Condition 4
            if (!verify(drinks, 'tea', nations, 'Ukrainian'))
              continue; //Enforce Condition 5
            for (var smokes in p(_smokes)) {
              if (done) break;
              if (!verify(pets, 'snails', smokes, 'Old Gold'))
                continue; //Enforce Condition 7
              if (!verify(colors, 'yellow', smokes, 'Kools'))
                continue; //Enforce Condition 8
              if (!verify(drinks, 'juice', smokes, 'Lucky Strike'))
                continue; //Enforce Condition 13
              if (!verify(nations, 'Japanese', smokes, 'Parliaments'))
                continue; //Enforce Condition 14
              var houses = List<Map<String, String>>.filled(HOUSES, {});
              for (var i = 0; i < HOUSES; i++) {
                houses[i] = {
                  'nation': nations[i] as String,
                  'color': colors[i] as String,
                  'pet': pets[i] as String,
                  'drink': drinks[i] as String,
                  'smoke': smokes[i] as String,
                };
              }
              if (test_houses(houses)) {
                solution = houses;
                done = true;
              }
            }
          }
        }
      }
    }
  }

  String get drinksWater {
    for (var h in solution) {
      if (h['drink'] == 'water') {
        return h['nation']!;
      }
    }
    return 'n.a.';
  }

  String get ownsZebra {
    for (var h in solution) {
      if (h['pet'] == 'zebra') {
        return h['nation']!;
      }
    }
    return 'n.a.';
  }
}

Iterable<List<void>> p(List<void> choices) sync* {
  if (choices.length == 1) {
    yield choices;
  } else {
    for (int i = 0; i < choices.length; i++) {
      List<void> remainingChoices = new List<void>.from(choices);
      remainingChoices.removeAt(i);
      for (List<void> permutation in p(remainingChoices)) {
        yield [choices[i], ...permutation];
      }
    }
  }
}

bool test_houses(List<Map<String, String>> houses) {
  var constraintMap = [
    c1(houses),
    c2(houses),
    c3(houses),
    c4(houses),
    c5(houses),
    c6(houses),
    c7(houses),
    c8(houses),
    c9(houses),
    c10(houses),
    c11(houses),
    c12(houses),
    c13(houses),
    c14(houses),
    c15(houses),
  ];

  return constraintMap.every((c) => c == true);
}

bool c1(List<Map<String, String>> houses) {
  /** Constraint 1:
   *  There should be 5 houses
  */
  return houses.length == HOUSES;
}

bool c2(List<Map<String, String>> houses) {
  /** Constraint 2:
   *  The **English** lives in **red** house
   */
  return houses.any((h) => h['nation'] == 'English' && h['color'] == 'red');
}

bool c3(List<Map<String, String>> houses) {
  /** Constraint 3:
   *  The **Spanish** owns **dog** 
   */
  return houses.any((h) => h['nation'] == 'Spanish' && h['pet'] == 'dog');
}

bool c4(List<Map<String, String>> houses) {
  /** Constraint 4:
   *  The **green** house drinks **coffee**
   */
  return houses.any((h) => h['color'] == 'green' && h['drink'] == 'coffee');
}

bool c5(List<Map<String, String>> houses) {
  /** Constraint 5:
   *  The **green** house drinks **coffee**
   */
  return houses.any((h) => h['nation'] == 'Ukrainian' && h['drink'] == 'tea');
}

bool c6(List<Map<String, String>> houses) {
  /** Constraint 6:
   *  The **green** house is immediately to the right of the **ivory** house.
   */
  for (var i = 0; i <= HOUSES - 2; i++) {
    if (houses[i + 1]['color'] == 'green' && houses[i]['color'] == 'ivory') {
      return true;
    }
  }

  return false;
}

bool c7(List<Map<String, String>> houses) {
  /** Constraint 7:
   *  The **Old Gold** smoker owns **snails**.
   */
  return houses.any((h) => h['smoke'] == 'Old Gold' && h['pet'] == 'snails');
}

bool c8(List<Map<String, String>> houses) {
  /** Constraint 8:
   *  **Kools** are smoked in the **yellow** house.
   */
  return houses.any((h) => h['smoke'] == 'Kools' && h['color'] == 'yellow');
}

bool c9(List<Map<String, String>> houses) {
  /** Constraint 9:
   *  **Milk** is drunk in the middle house.
   */
  return houses[2]['drink'] == 'milk';
}

bool c10(List<Map<String, String>> houses) {
  /** Constraint 10:
   *  The **Norwegian** lives in the first house.
   */
  return houses[0]['nation'] == 'Norwegian';
}

bool c11(List<Map<String, String>> houses) {
  /** Constraint 11:
   *  The man who smokes **Chesterfields** lives in the house next to the man with the **fox**.
   */
  var c1 = "Chesterfields";
  var c2 = 'fox';
  if (houses[0]['smoke'] == c1 && houses[1]['pet'] == c2) return true;
  if (houses[4]['smoke'] == c1 && houses[3]['pet'] == c2) return true;

  for (var i = 1; i <= 3; i++) {
    if (houses[i]['smoke'] == c1 &&
        (houses[i - 1]['pet'] == c2 || houses[i + 1]['pet'] == c2)) return true;
  }
  return false;
}

bool c12(List<Map<String, String>> houses) {
  /** Constraint 12:
   * **Kools** are smoked in the house next to the house where the **horse** is kept.
   */
  var c1 = "Kools";
  var c2 = 'horse';
  if (houses[0]['smoke'] == c1 && houses[1]['pet'] == c2) return true;
  if (houses[4]['smoke'] == c1 && houses[3]['pet'] == c2) return true;

  for (var i = 1; i <= 3; i++) {
    if (houses[i]['smoke'] == c1 &&
        (houses[i - 1]['drink'] == c2 || houses[i + 1]['drink'] == c2))
      return true;
  }
  return false;
}

bool c13(List<Map<String, String>> houses) {
  /** Constraint 13:
   *  The **Lucky Strike** smoker drinks orange **juice**.
   */
  return houses
      .any((h) => h['smoke'] == 'Lucky Strike' && h['drink'] == 'juice');
}

bool c14(List<Map<String, String>> houses) {
  /** Constraint 14:
   *  The **Japanese** smokes **Parliaments**.
   */
  return houses
      .any((h) => h['smoke'] == 'Parliaments' && h['nation'] == 'Japanese');
}

bool c15(List<Map<String, String>> houses) {
  /** Constraint 15:
   *  The **Norwegian** lives next to the **blue** house.
   *  Based on Constraint 10, blue house should be 2
   */
  return houses[1]['color'] == 'blue';
}

//Helper function to check if Condition1 has Result1 AND Condition2 has Result2
bool verify(c1, r1, c2, r2) {
  for (var i = 0; i < HOUSES; i++) {
    if (c1[i] == r1 && c2[i] == r2) return true;
  }
  return false;
}

void main() {
  var puzzle = new ZebraPuzzle();
  puzzle.solve();
  print(puzzle.solution);
}
