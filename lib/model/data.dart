class Data {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.name, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'first_name': firstName,
    'last_name': lastName,
    'avatar': avatar
  };
}
