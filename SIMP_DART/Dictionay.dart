typedef Word = Map<String, String>;

class Dictionary {
  final List<Word> words = [];

  void add(String word, String meaning) {
    words.add({word: meaning});
  }

  Word get(String word) {
    return words.firstWhere((element) => element.containsKey(word));
  }

  void delete(String word) {
    words.removeWhere((element) => element.containsKey(word));
  }

  void update(String word, String meaning) {
    words.firstWhere((element) => element.containsKey(word)).update(word, (value) => meaning);
  }

  void showAll() {
    print(words);
  }

  int count() {
    return words.length;
  }

  void upsert(String word, String meaning) { 
    if (words.any((element) => element.containsKey(word))) {
      update(word, meaning);
    } else {
      add(word, meaning);
    }
  }

  bool exists(String word) {
    return words.any((element) => element.containsKey(word));
  }

  void bulkAdd(List<Word> words) {
    this.words.addAll(words);
  }

  void bulkDelete(List<String> words) {
    this.words.removeWhere((element) => words.contains(element.keys.first));
  } 
}

void main() {
  var dictionary = Dictionary();
  dictionary.add("apple", "a fruit");
  dictionary.add("banana", "a fruit");
  dictionary.showAll();

  dictionary.upsert("apple", "a red fruit");
  dictionary.showAll();

  dictionary.delete("banana");
  dictionary.showAll();
}
