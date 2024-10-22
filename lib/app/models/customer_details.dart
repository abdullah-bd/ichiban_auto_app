
class CustomerDetails {
  CustomerDetails({
    String? email,
    String? name,
    String? phoneNumber,}){
    _email = email;
    _name = name;
    _phoneNumber = phoneNumber;
  }

  CustomerDetails.fromJson(dynamic json) {
    _email = json['email'];
    _name = json['name'];
    _phoneNumber = json['phoneNumber'];
  }
  String? _email;
  String? _name;
  String? _phoneNumber;
  CustomerDetails copyWith({  String? email,
    String? name,
    String? phoneNumber,
  }) => CustomerDetails(  email: email ?? _email,
    name: name ?? _name,
    phoneNumber: phoneNumber ?? _phoneNumber,
  );
  String? get email => _email;
  String? get name => _name;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['name'] = _name;
    map['phoneNumber'] = _phoneNumber;
    return map;
  }

}