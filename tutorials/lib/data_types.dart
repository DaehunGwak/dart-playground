void dataTypesMain() {
  basicDataType();
  listType();
  stringInterpolation();
  collectionFor();
  mapTest();
  listTest2();
  setTest();
  print('');
}

// 대부분 Object 구현체
// num -> int, double 구현
void basicDataType() {
  String name = 'hello';
  bool boolean = true;
  int integer = 123;
  double floating = 123.123;
  num number = 4.56;

  print(name.runtimeType);
  print(boolean.runtimeType);
  print(integer.runtimeType);
  print(floating.runtimeType);
  print(number.runtimeType);
  // double 로 나옴 (할당 시 상위 클래스로 할당을 해도 최종 구현 타입이 나오는 구조인가봄)
}

void listType() {
  var numbers = [
    1,
    2,
    3,
    // if (false) 4, // collection if
    if (true) 5,
  ];
  print(numbers); // [1, 2, 3, 5];
}

void stringInterpolation() {
  var name = 'ordi';
  var age = 13;
  print('$name, ${age + 16}');
}

void collectionFor() {
  var list1 = [1, 2, 3];
  var list2 = [100, for (var item in list1) item * 10];
  print(list2.map((e) => e * 1000).toList());
  print(list2.where((e) => e > 20).toList());
  print(list2);
}

 void mapTest() {
  var key1 = [1, 2];
  var m = {[1, 2]: false, [2, 3]: '123', key1: 4444};
  m[[1, 2]] = 123;
  m[key1] = 456;
  print(m);
  print(m.containsKey([1, 2])); // false
  print(m.containsKey(key1)); // true
  print(key1);
 }

 void listTest2() {
  var list1 = [1, 2];
  functionTest1(list1); // 레퍼런스 넘어가서 같이 수정
  print(list1);
  functionTest2(list1); // final 방어 안됨
  print(list1);
  functionTest3(list1); // 함수형 사용하자
  print(list1);
 }

// 레퍼런스가 넘어가는구나
 void functionTest1(List<int> l) {
  for (var i = 0; i < l.length; i++) {
    l[i] *= 2;
  }
  l.add(3);
  print(l);
 }

// 방어 안됨
 void functionTest2(final List<int> l) {
  for (var i = 0; i < l.length; i++) {
    l[i] *= 2;
  }
  l.add(3);
  print(l);
 }

 void functionTest3(List<int> l) {
  var result = l.map((e) => e * 2).toList();
  print(result);
 }

 void setTest() {
  var s = {1, 2, 3};
  s.add(3);
  print(s);
 }