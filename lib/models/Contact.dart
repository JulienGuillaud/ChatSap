class Contact {
  final int contactId;
  final String firstName, lastName, image, username;

  Contact({
    this.contactId = 0,
    this.username = "",
    this.firstName = "",
    this.lastName = "",
    this.image = "",
  });

  static Contact findContact(id) {
    return contactData.firstWhere((o) => o.contactId == id);
  }
}

List contactData = [
  Contact(
    contactId: 1,
    username: "FouDuGO",
    firstName: "Yanis",
    lastName: "GO",
    image: "assets/images/user.png",
  ),
  Contact(
    contactId: 2,
    username: "julien",
    firstName: "Julien",
    lastName: "G",
    image: "assets/images/user_2.png",
  ),
];
