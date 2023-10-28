void functionsMain() {
  defaultFunction();
  namedParamters();
  optionalPositionalParameters();
  qqOperator();
}

void defaultFunction() {
  print(plusTest(2, 3));
  print(plusTest(3.3, 4.4));
  print(plusTest(3.3, 3));
}

num plusTest(num n1, num n2) => n1 + n2;

void namedParamters() {
  print(sayHello(age: 12, name: 'ordi'));
  print(sayHello(name: 'ordi'));
  // print(sayHello()); // `name` argument required error
}

String sayHello({
  required String name,
  int age = 10
  }) => 'hello, $name($age)!';

void optionalPositionalParameters() {
  print(optionalSayHello('ordi'));
}

String optionalSayHello(String name, [int? age = 10]) => 
    'optionally, $name($age)';

void qqOperator() {
  print(capitalizeName1(null));
  print(capitalizeName2(null));
  print(capitalizeNameQq(null));

  // qq assign
  String? name;
  // print(name?.toUpperCase()); // null return
  name ??= 'ooooo'; // name 이 null 이라면 assign
  // print(name?.toUpperCase());
}

String capitalizeName1(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return 'ANONNYMOUS';
}

String capitalizeName2(String? name) =>
    name != null ? name.toUpperCase() : 'ANON2';

String capitalizeNameQq(String? name) =>
    name?.toUpperCase() ?? 'ANONQQ';

typedef ListOfInts = List<int>;

void typedefMain() {
  print(reverseList([1, 2 ,3]));
}

ListOfInts reverseList(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}