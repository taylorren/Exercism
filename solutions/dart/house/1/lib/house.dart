class House {
  final List<String> _subjects = [
    'the house',
    'the malt',
    'the rat',
    'the cat',
    'the dog',
    'the cow with the crumpled horn',
    'the maiden all forlorn',
    'the man all tattered and torn',
    'the priest all shaven and shorn',
    'the rooster that crowed in the morn',
    'the farmer sowing his corn',
    'the horse and the hound and the horn'
  ];

  final List<String> _actions = [
    '',
    'that lay in the house',
    'that ate the malt',
    'that killed the rat',
    'that worried the cat',
    'that tossed the dog',
    'that milked the cow with the crumpled horn',
    'that kissed the maiden all forlorn',
    'that married the man all tattered and torn',
    'that woke the priest all shaven and shorn',
    'that kept the rooster that crowed in the morn',
    'that belonged to the farmer sowing his corn'
  ];

  static const String _finalPart = 'that Jack built.';

  String _verse(int n) {
    if (n == 1) return 'This is ${_subjects[0]} $_finalPart';

    final parts = <String>[];
    parts.add('This is ${_subjects[n - 1]}');

    for (var i = n - 1; i >= 1; i--) {
      parts.add(_actions[i]);
    }

    parts.add(_finalPart);

    return parts.join(' ');
  }

  String recite(int startVerse, int endVerse) {
    final verses = <String>[];
    for (var v = startVerse; v <= endVerse; v++) {
      verses.add(_verse(v));
    }
    return verses.join('\n');
  }
}
