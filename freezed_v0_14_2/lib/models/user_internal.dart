class UserInternal {
  String name;
  int? age;
  int userId;

  UserInternal({required this.name, this.age, required this.userId});

  UserInternal.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        userId = json['userId'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'userId': userId};
  }
}