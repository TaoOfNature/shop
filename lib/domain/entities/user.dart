class User {
  final String id;
  final String name;

  const User({required this.id, required this.name});

  User copyWith({String? id, String? name}) {
    return User(id: id ?? this.id, name: name ?? this.name);
  }
}
