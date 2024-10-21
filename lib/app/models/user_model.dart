class UserModel {
  UserModel({
    num? createdAt,
    String? email,
    String? name,
    String? role,}){
    _createdAt = createdAt;
    _email = email;
    _name = name;
    _role = role;
  }

  UserModel.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _email = json['email'];
    _name = json['name'];
    _role = json['role'];
  }
  num? _createdAt;
  String? _email;
  String? _name;
  String? _role;
  UserModel copyWith({  num? createdAt,
    String? email,
    String? name,
    String? role,
  }) => UserModel(  createdAt: createdAt ?? _createdAt,
    email: email ?? _email,
    name: name ?? _name,
    role: role ?? _role,
  );
  num? get createdAt => _createdAt;
  String? get email => _email;
  String? get name => _name;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['email'] = _email;
    map['name'] = _name;
    map['role'] = _role;
    return map;
  }
  @override
  String toString() {

    return 'UserModel(createdAt: $_createdAt, email: $_email, name: $_name, role: $_role)';
  }

}