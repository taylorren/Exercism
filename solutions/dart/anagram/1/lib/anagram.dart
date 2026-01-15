class Anagram {
  String _sortString(String input){
    return (input.split('')..sort()).join('');
  }  // Put your code here

  List<String> findAnagrams(String word, List<String> candidates) {
    final sortedWord = _sortString(word.toLowerCase());

    var anagrams=candidates.where((candidate){
      if(candidate.toLowerCase()==word.toLowerCase()){
        return false;
      }
      return _sortString(candidate.toLowerCase()) == sortedWord.toLowerCase();
    }).toList();
    
    return anagrams;
  }
}
