class SpaceAge {
  num age({required String planet, required num seconds}) {
    num res;
    switch (planet) {
      case 'Earth':
        res = seconds / 31557600;
        break;
      case 'Mercury':
        res = seconds / 7600525;
        break;
      case 'Venus':
        res = seconds / 19411026;
        break;
      case 'Mars':
        res = seconds / 59360959;
        break;
      case 'Jupiter':
        res = seconds / 374222565;
        break;
      case 'Saturn':
        res = seconds / 930232558;
        break;
      case 'Uranus':
        res = seconds / 2630703165;
        break;
      case 'Neptune':
        res = seconds / 5202924160;
        break;
      default:
        return 0;
    }
    return double.parse(res.toStringAsFixed(2));
  }
}
