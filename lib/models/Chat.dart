class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Yanis GO",
    lastMessage: "Mets toi au go",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Julien G",
    lastMessage: "Gros tfq",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
];
