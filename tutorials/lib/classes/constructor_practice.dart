import 'dart:convert';

void practiceMain() {
  fromDataSuccessCase();
  fromDataNullCase();
  multipleDataTest();
}

void fromDataSuccessCase() {
  var apiData = {
    'name': 'nnnnnnn',
    'age': 12,
    'xp': 123,
    'team': 'yellow',
  };
  var player1 = Player.fromJson(apiData);
  print(player1);
}

void fromDataNullCase() {
  var apiData = {
    'name': 'n2',
    'xp': 123,
  };
  var player = Player.fromJson(apiData);
  print(player);
}

void multipleDataTest() {
  var apiJsons = [
    {
      'name': 'n1',
      'xp': 1,
    },
    {
      'name': 'n2',
      'xp': 2,
    },
    {
      'name': 'n3',
      'xp': 3,
    },
  ];
  var players = apiJsons.map((e) => Player.fromJson(e)).toList();
  print(players);
}

class Player {
  static const _defaultTeam = 'default';

  final String name;
  int xp;
  int age;
  String team;

  Player(
      {required this.name,
      this.xp = 0,
      this.age = 0,
      this.team = _defaultTeam});

  Player.fromJson(Map<String, dynamic> data)
      : name = data['name'], // null을 허용하지 않겠다는 의지 (에러 발생하라지)
        xp = data['xp'] ?? 0,
        age = data['age'] ?? 0,
        team = data['team'] ?? _defaultTeam;

  Map<String, dynamic> toJson() {
    final jsonMap = <String, dynamic>{};
    jsonMap['name'] = name;
    jsonMap['xp'] = xp;
    jsonMap['age'] = age;
    jsonMap['team'] = team;
    return jsonMap;
  }

  @override
  String toString() {
    return '${super.toString()} ${jsonEncode(this)}}';
  }
}
