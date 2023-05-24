class UserObject {
  final String name;
  final String image;

  UserObject({required this.name, required this.image});

  factory UserObject.fromJson(Map<String, dynamic> json) {
    return UserObject(
      name: json['display_name'],
      image: json['images'][0]['url'],
    );
  }
}
