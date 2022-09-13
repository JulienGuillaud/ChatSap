class Contact {
  final int contactId;
  final String firstName, lastName, image;

  Contact({
    this.contactId = 0,
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
    firstName: "Yanis",
    lastName: "GO",
    image: "assets/images/user.png",
  ),
  Contact(
    contactId: 2,
    firstName: "Julien",
    lastName: "G",
    image: "assets/images/user_2.png",
  ),
];
