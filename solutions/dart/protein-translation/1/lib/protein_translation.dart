class ProteinTranslation {
  List<String> translate(String str) {
    List<String> res = [];

    if (str == '') return res;
    for (var i = 0; i < str.length; i += 3) {
      var sub = str.substring(i, i + 3);
      switch (sub) {
        case 'UAA':
        case 'UAG':
        case 'UGA':
          return res;
        case 'AUG':
          res.add('Methionine');
          break;
        case 'UUU':
        case 'UUC':
          res.add('Phenylalanine');
          break;
        case 'UUA':
        case 'UUG':
          res.add('Leucine');
          break;
        case 'UCU':
        case 'UCC':
        case 'UCA':
        case 'UCG':
          res.add('Serine');
          break;
        case 'UAU':
        case 'UAC':
          res.add('Tyrosine');
          break;
        case 'UGU':
        case 'UGC':
          res.add('Cysteine');
          break;
        case 'UGG':
          res.add('Tryptophan');
          break;
        default:
          throw (ArgumentError());
      }
    }

    return res;
  }
}
