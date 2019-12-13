class User {
  final int id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"];
}