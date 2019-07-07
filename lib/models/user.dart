class User {
  final int id;
  String uniqueId;
  String email;
  String username;
  String name;
  bool useGravatar;
  String avatarUrl;
  int age;
  String gender;
  String birthday;
  String company;
  String website;
  String bio;
  String deletedAt;
  String createdAt;
  String updatedAt;

  User({
    this.id,
    this.uniqueId,
    this.email,
    this.username,
    this.name,
    this.useGravatar,
    this.avatarUrl,
    this.age,
    this.gender,
    this.birthday,
    this.company,
    this.website,
    this.bio,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      uniqueId: json['unique_id'],
      email: json['email'],
      username: json['username'],
      name: json['name'],
      useGravatar: json['use_gravatar'],
      avatarUrl: json['avatar_url'],
      age: json['age'],
      gender: json['gender'],
      birthday: json['birthday'],
      company: json['company'],
      website: json['website'],
      bio: json['bio'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'unique_id': uniqueId,
        'email': email,
        'username': username,
        'name': name,
        'use_gravatar': useGravatar,
        'avatar_url': avatarUrl,
        'age': age,
        'gender': gender,
        'birthday': birthday,
        'company': company,
        'website': website,
        'bio': bio,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
