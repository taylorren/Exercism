class SpaceAge {
  num age({required String planet, required num seconds}) {
    num res;
    switch (planet) {
      case 'Earth':
        res = seconds / 31557600;
        break;
      case 'Mercury':
        res = seconds / 60191000;
        break;
      case 'Venus':
        res = seconds / 91959999;
        break;
      case 'Mars':
        res = seconds / 146000000;
        break;
      case 'Jupiter':
        res = seconds / 433281000;
        break;
      case 'Saturn':
        res = seconds / 1076023600;
        break;
      case 'Uranus':
        res = seconds / 3068800000;
        break;
      case 'Neptune':
        res = seconds / 6018300000;
        break;
      default:
        return 0;
    }
    return double.parse(res.toStringAsFixed(2));
  }
}
