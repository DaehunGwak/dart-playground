import 'dart:convert';

void enumsMain() {
  var player = Player(name: 'tname')
      ..team = Team.red;
  print(player.toString());
  print(Team.red);
}

enum Team {
  red('left'),
  blue('right'),
  observation('everywhere');

  final String position;

  const Team(this.position);

  Map<String, dynamic> toJson() {
    final jsonMap = <String, dynamic>{};
    jsonMap['name'] = name;
    jsonMap['position'] = position;
    return jsonMap;
  }

  @override
  String toString() {
    return 'Team.$name{"position":"$position"}';
  }
}

class Player {
  final String name;
  Team team;

  Player({required this.name, this.team = Team.observation});

  Map<String, dynamic> toJson() {
    final jsonMap = <String, dynamic>{};
    jsonMap['name'] = name;
    jsonMap['team'] = team;
    return jsonMap;
  }

  @override
  String toString() {
    return 'Player${jsonEncode(this)}';
  }
}
