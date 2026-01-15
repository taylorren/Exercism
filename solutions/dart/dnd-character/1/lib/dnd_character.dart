import 'dart:math';

class DndCharacter {
  int strength = 0,
      dexterity = 0,
      constitution = 0,
      intelligence = 0,
      wisdom = 0,
      charisma = 0;
  int hitpoints = 0;

  static DndCharacter create() {
    var c = DndCharacter();
    c.strength = DndCharacter.ability();
    c.dexterity = DndCharacter.ability();
    c.constitution = DndCharacter.ability();
    c.intelligence = DndCharacter.ability();
    c.wisdom = DndCharacter.ability();
    c.charisma = DndCharacter.ability();
    c.hitpoints = 10 + DndCharacter.modifier(c.constitution);

    return c;
  }

  static int ability() {
    final rnd = new Random();
    return rnd.nextInt(15) + 3;
  }

  static int modifier(int constitution) {
    return ((constitution - 10) / 2).floor();
  }
  // Put your code here
}
