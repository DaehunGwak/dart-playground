void variablesMain() {
  varTest();
  dynamicTest();
  nullSafetyTest();
  finalTest();
  lateTest();
  constTest();
}

// 초기화
void varTest() {
  var name = 'ordi';
  print(name);
}

// ummm 별로 안좋아 보임
void dynamicTest() {
  dynamic something;

  something = 'somthing';
  if (something is String) {
    print(something.length);
  }

  something = 123;
  if (something is int) {
    print(something.isEven);
  }
}

void nullSafetyTest() {
  nonNullSafetyMethod(null);
  nonNullSafetyMethod('somthing');
  // nullSafetyMethod(null); // 컴파일러 단계에서 에러를 잡아 냄
  nullSafetyMethod('somthing');
}

void nonNullSafetyMethod(String? string) {
  print(string?.isEmpty);
}

void nullSafetyMethod(String string) {
  print(string);
}

void finalTest() {
  final name = 'ordi';
  // name = 'diff'; // 불가능

  var some = '123';
  // some = 123; // 타입 변경 불가능

  print(name + some);
}

void lateTest() {
  late final String name;
  // print(name); // 컴파일러 에러
  name = 'ordi';
  print(name);
}

void constTest() {
  // const message = constFunc('the'); // 컴파일러 에러
  const message = 'finish, the chapter of variables.\n';
  print(message);
}

String constFunc(String somthing) => 'what, $somthing';