import 'dart:convert';

void abstractMain() {
  Human somebody = Player(name: 'player1');
  somebody.printInfo();
  somebody.walk();
}

abstract class Human {
  void printInfo();
  void walk() {
    print('human walking style');
  }
}

class Player extends Human {
  final String name;
  int xp;

  Player({required this.name, this.xp = 0});

  @override
  void printInfo() {
    print(this);
  }

  Map<String, dynamic> toJson() {
    final jsonMap = <String, dynamic>{};
    jsonMap['name'] = name;
    jsonMap['xp'] = xp;
    return jsonMap;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}