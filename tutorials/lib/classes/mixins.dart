void mixinsMain() {
  final player = Player(team: Team.red);
  player.run();
  player.attack();
}

mixin Strong {
  final double strengthLevel = 1500.99;
}

mixin Runner {
  void run();
}

enum Team {blue, red}

class Player with Strong, Runner {
  final Team team;

  Player({
    required this.team
  });

  @override
  void run() {
    print('run! player!');
  }

  void attack() {
    print('attack! my strength is $strengthLevel');
  }
}