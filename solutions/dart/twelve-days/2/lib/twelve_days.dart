class TwelveDays {
  static const List<String> _ordinals = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth',
  ];

  static const List<String> _gifts = [
    'a Partridge in a Pear Tree.',
    'two Turtle Doves,',
    'three French Hens,',
    'four Calling Birds,',
    'five Gold Rings,',
    'six Geese-a-Laying,',
    'seven Swans-a-Swimming,',
    'eight Maids-a-Milking,',
    'nine Ladies Dancing,',
    'ten Lords-a-Leaping,',
    'eleven Pipers Piping,',
    'twelve Drummers Drumming,',
  ];

  String recite(int startVerse, int endVerse) {
    if (startVerse > endVerse) return '';

    final boundedStart = startVerse.clamp(1, 12);
    final boundedEnd = endVerse.clamp(1, 12);
    if (boundedStart > boundedEnd) return '';

    final verses = <String>[];
    for (var verse = boundedStart; verse <= boundedEnd; verse++) {
      verses.add(_verse(verse));
    }
    return verses.join('\n');
  }

  String _verse(int verse) {
    final start =
        'On the ${_ordinals[verse - 1]} day of Christmas my true love gave to me:';

    if (verse == 1) {
      return '$start ${_gifts.first}';
    }

    final parts = <String>[start];

    for (var giftIndex = verse - 1; giftIndex >= 0; giftIndex--) {
      if (giftIndex == 0) {
        parts.add('and ${_gifts[giftIndex]}');
      } else {
        parts.add(_gifts[giftIndex]);
      }
    }

    return parts.join(' ');
  }
}
