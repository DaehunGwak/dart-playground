import 'dart:convert';

void cascadeMain() {
  var player = Player(name: 'tname')
    ..age = 15
    ..xp = 10000
    // ..name = 'changedName' // final variable assignment compile error
    ..printInfo();

  print(player..age = 30); // age 30 으루 set 후, player 객체를 반환
}

class Player {
  final String name;
  int xp;
  int age;

  Player({required this.name, this.xp = 0, this.age = 0});

  void printInfo() {
    print('info: $this');
  }

  Map<String, dynamic> toJson() {
    final jsonMap = <String, dynamic>{};
    jsonMap['name'] = name;
    jsonMap['xp'] = xp;
    jsonMap['age'] = age;
    return jsonMap;
  }

  @override
  String toString() {
    return 'Player{${jsonEncode(this)}}';
  }
}
