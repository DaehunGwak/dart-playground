void defaultMain() {
  var player = Player();
  print(player.name);
  // player.name = 'lalala'; // final 지정되어 못바꿈
  // print(player.name);
  print(player.xp);

  player.sayHello();
}

class Player {
  final String name = 'ordi';
  int xp = 1500;

  void sayHello() {
    print('hi, my name is $name');
  }
}