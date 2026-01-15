// nucleotide_count.dart
class InvalidNucleotideException implements Exception {
  final String message;
  InvalidNucleotideException(this.message);
  
  @override
  String toString() => message;
}

class NucleotideCount {
  Map<String, int> count(String strand) {
    final nucleotides = {"A": 0, "C": 0, "G": 0, "T": 0};

    for (var nucleotide in strand.split('')) {
      if (nucleotides.containsKey(nucleotide)) {
        nucleotides[nucleotide] = nucleotides[nucleotide]! + 1;
      } else {
        throw InvalidNucleotideException('Invalid nucleotide: $nucleotide');
      }
    }

    return nucleotides;
  }
}