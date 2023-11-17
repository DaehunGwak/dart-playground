/// flutter 챌린지 2기
/// 5 of 70: Dictionary 구현 과제

/// Dictionary 각 메소드 테스트 메인 함수
void main(List<String> arguments) {
  final dict = Dictionary();

  // add, get test
  dict.add("나", "본인");
  dict.add("나", "이건 업데이트 안됨");
  dict.add("걍", "그냥");
  assert(dict.get("나") == "본인");
  assert(dict.get("걍") == "그냥");

  // delete test
  dict.delete("걍");
  assert(dict.get("걍") == null);

  // update test
  dict.update("나", "나는 나다");
  // dict.update("걍", "현재 존재하지 않아 불가능"); // ArgumentError 발생
  assert(dict.get("나") == "나는 나다");
  assert(dict.get("걍") == null);

  // do showAll
  dict.showAll();

  // count test
  assert(dict.count() == 1);
  dict.delete("나");
  assert(dict.count() == 0);

  // upsert test
  dict.add("나", "123");
  dict.upsert("나", "456");
  dict.upsert("너", "789");
  assert(dict.count() == 2);
  assert(dict.get("나") == "456");
  assert(dict.get("너") == "789");
  dict.showAll();

  // exists test
  assert(dict.exists("나") == true);
  assert(dict.exists("우리") == false);

  // bulkAdd test
  dict.bulkAdd([
    {"term": "김치", "definition": "대박이네~"},
    {"term": "아파트", "definition": "비싸네~"}
  ]);
  dict.showAll();
  assert(dict.count() == 4);
  assert(dict.get("김치") == "대박이네~");
  assert(dict.get("아파트") == "비싸네~");

  // bulkDelete test
  dict.bulkDelete(["김치", "아파트"]);
  assert(dict.count() == 2);
  assert(dict.get("김치") == null);
  assert(dict.get("아파트") == null);
}

/// Dictionary 정의
typedef DictionaryItem = Map<String, String>;

class Dictionary {
  static const _TERM = "term";
  static const _DEFINITION = "definition";

  final _itemMap = <String, String>{};

  void bulkAdd(List<DictionaryItem> items) {
    for (var item in items) {
      add(item[_TERM]!, item[_DEFINITION]!);
    }
  }

  void add(String term, String definition) =>
      _itemMap.putIfAbsent(term, () => definition);

  String? get(String term) => _itemMap[term];

  void bulkDelete(List<String> terms) {
    for (var t in terms) {
      delete(t);
    }
  }

  void delete(String term) => _itemMap.remove(term);

  void update(String term, String definition) =>
      _itemMap.update(term, (_) => definition);

  void showAll() {
    print("[");
    _itemMap.forEach((k, v) => print("\t{term:$k, definition:$v},"));
    print("]");
  }

  int count() => _itemMap.length;

  void upsert(String term, String definition) => _itemMap[term] = definition;

  bool exists(String term) => _itemMap.containsKey(term);
}
