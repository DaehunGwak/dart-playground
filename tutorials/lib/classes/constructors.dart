void constructorsMain() {
  // var player = Player('ordi', 1000, 'red', 10);
  var player = Player(name: 'ordi', xp: 1000, team: 'red', age: 10);
  var bluePlayer = Player.createBluePlayer(name: 'ordi', age: 10);
  var redPlayer = Player.createRedPlayer(name: 'ordi', age: 15);
  
  player.sayHello();
  bluePlayer.sayHello();
  redPlayer.sayHello();

  Player.staticTest();
}

class Player {
  final String name;
  int xp, age; // 좋아보이진 않음
  String team;

  // Player(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

  // Player(this.name, this.xp, this.team, this.age); // positional constructor

  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age}); // named constructor parameters

  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = 0; // named constructor parameters

  Player.createRedPlayer({required this.name, required this.age})
      : team = 'red',
        xp = 0; // named constructor parameters 2

  void sayHello() {
    print('hello~ name is $name! info(team:$team, xp:$xp, age:$age)');
  }

  static void staticTest() {
    print("sttttt");
  }
}
